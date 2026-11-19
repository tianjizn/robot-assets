#!/bin/bash
# 按机型发 Release：每个机型一个 tag，Release 内每个变体包一个 asset
set -uo pipefail

REPO="tianjizn/robot-assets"
DIST="$(cd "$(dirname "$0")/.." && pwd)/dist"
TOKEN="$(gh auth token)"

release_title() {
  case "$1" in
    Luna_V3_URDF)         echo "Gento Luna V3 URDF/MJCF 资源" ;;
    Marvin_Dual-arm_URDF) echo "Marvin 双臂 URDF/MJCF 资源" ;;
    Marvin_Pro_V3_URDF)   echo "Marvin Pro V3 URDF/MJCF 资源" ;;
    Skye_V4_URDF)         echo "Gento Skye V4 URDF/MJCF 资源" ;;
    *)                    echo "$1 URDF/MJCF 资源" ;;
  esac
}

MODELS=(Luna_V3_URDF Marvin_Dual-arm_URDF Marvin_Pro_V3_URDF Skye_V4_URDF)

for tag in "${MODELS[@]}"; do
  dir="$DIST/$tag"
  [ -d "$dir" ] || continue
  n=$(find "$dir" -name '*.tar.gz' | wc -l | tr -d ' ')
  echo "########## $tag ($n 个包) ##########"

  # 生成 notes
  notes="## 内容
本 Release 包含 ${n} 个 URDF/MJCF 变体包，每个 tar.gz 对应一个变体（含 urdf、MJCF、meshes）。

## 变体清单
"
  while IFS= read -r f; do
    notes="${notes}- $(basename "$f" .tar.gz)
"
  done < <(find "$dir" -name '*.tar.gz' | sort)

  # 建 Release（若 tag 已存在且 Release 有效则复用）
  rel_id=$(gh api "repos/$REPO/releases/tags/$tag" -q .id 2>/dev/null)
  case "$rel_id" in ''|*[!0-9]*) rel_id="" ;; esac
  if [ -z "$rel_id" ]; then
    printf '%s' "$notes" > /tmp/rel_notes.md
    gh release create "$tag" -R "$REPO" --title "$(release_title "$tag")" --notes-file /tmp/rel_notes.md >/dev/null 2>&1
    rel_id=$(gh api "repos/$REPO/releases/tags/$tag" -q .id 2>/dev/null)
    case "$rel_id" in ''|*[!0-9]*) rel_id="" ;; esac
    echo "已创建 Release: $tag (id=$rel_id)"
  else
    echo "Release 已存在: $tag (id=$rel_id)"
  fi
  [ -z "$rel_id" ] && { echo "!! 创建失败，跳过"; continue; }

  # 逐个上传
  gh api "repos/$REPO/releases/$rel_id/assets" -q '.[].name' > /tmp/existing_assets.txt 2>/dev/null
  while IFS= read -r f; do
    name=$(basename "$f")
    if grep -qx "$name" /tmp/existing_assets.txt 2>/dev/null; then
      echo "  跳过(已存在): $name"
      continue
    fi
    echo "  上传: $name ($(du -h "$f" | cut -f1))"
    ok=0
    for attempt in 1 2 3; do
      resp=$(curl -sS -X POST \
        -H "Authorization: token $TOKEN" \
        -H "Content-Type: application/octet-stream" \
        --retry 10 --retry-delay 3 --retry-all-errors \
        --speed-limit 50 --speed-time 120 \
        --connect-timeout 30 \
        --max-time 3600 \
        --data-binary "@$f" \
        "https://uploads.github.com/repos/$REPO/releases/$rel_id/assets?name=$name" 2>&1)
      if printf '%s' "$resp" | grep -q '"state": *"uploaded"'; then
        echo "    OK"
        ok=1
        break
      else
        echo "    FAIL($attempt): $(printf '%s' "$resp" | head -c 200)"
        [ "$attempt" -lt 3 ] && sleep 5
      fi
    done
    [ "$ok" -eq 0 ] && echo "    !! $name 三次均失败"
  done < <(find "$dir" -name '*.tar.gz' | sort)
  echo
done
echo "全部完成"
