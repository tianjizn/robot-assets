#!/bin/bash
# 按机型打包：4 个机型目录，每个二级子目录打成一个 tar.gz
# 用法: ./pack_by_model.sh [源目录]
set -euo pipefail

SRC="${1:-/Users/gengsn/Desktop/TJassets_URDF-MJCF}"
DST="$(cd "$(dirname "$0")/.." && pwd)/dist"
MODELS=(Luna_V3_URDF Marvin_Dual-arm_URDF Marvin_Pro_V3_URDF Skye_V4_URDF)

mkdir -p "$DST"
total=0
for tag in "${MODELS[@]}"; do
  [ -d "$SRC/$tag" ] || { echo "跳过(不存在): $tag"; continue; }
  mkdir -p "$DST/$tag"
  echo "=== $tag ==="
  while IFS= read -r -d '' d; do
    name="$(basename "$d")"
    safe="$(printf '%s' "$name" | tr ' ' '_')"
    printf '  打包 %s -> %s.tar.gz\n' "$name" "$safe"
    tar -czf "$DST/$tag/$safe.tar.gz" \
        --exclude='.DS_Store' --exclude='__MACOSX' --exclude='._*' \
        -C "$SRC/$tag" "$name"
    total=$((total + 1))
  done < <(find "$SRC/$tag" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)
  echo
done
echo "完成，共 $total 个包，输出目录: $DST"
du -sh "$DST"/*/ 2>/dev/null
