#!/bin/bash
# 重构仓库目录：与新 Release 结构对齐
#   Luna_V3_URDF/{615,680,750}臂展/<变体>  ->  Luna_V3_URDF/<变体>
#   Skye_V4_URDF/{696,809,920}臂长系列/<变体> ->  Skye_V4_URDF/<变体>
#   Pro_V3_URDF/<臂长>/<变体>              ->  Marvin_Pro_V3_URDF/<变体>
#   双臂_URDF/<组>/<变体>                  ->  Marvin_Dual-arm_URDF/<组>/<变体>
set -euo pipefail
cd "$(dirname "$0")/.."

flatten() {  # $1=父目录  $2=中间层通配
  local parent="$1" pattern="$2" g d
  for g in "$parent"/$pattern; do
    [ -d "$g" ] || continue
    for d in "$g"/*; do
      [ -d "$d" ] || continue
      git mv "$d" "$parent/$(basename "$d")"
    done
    rmdir "$g"
  done
}

echo "--- 1. Luna 拍平臂展层 ---"
flatten Luna_V3_URDF '*臂展'

echo "--- 2. Skye 拍平臂长系列层 ---"
flatten Skye_V4_URDF '*臂长系列'

echo "--- 3. Pro 改父目录名并拍平 ---"
if [ -d Pro_V3_URDF ]; then
  mkdir -p Marvin_Pro_V3_URDF
  for g in Pro_V3_URDF/*; do
    [ -d "$g" ] || continue
    for d in "$g"/*; do
      [ -d "$d" ] || continue
      git mv "$d" "Marvin_Pro_V3_URDF/$(basename "$d")"
    done
    rmdir "$g"
  done
  rmdir Pro_V3_URDF
fi

echo "--- 4. 双臂改顶层名 ---"
if [ -d 双臂_URDF ]; then
  git mv 双臂_URDF Marvin_Dual-arm_URDF
fi

echo "--- 完成，新结构 ---"
for m in Luna_V3_URDF Marvin_Dual-arm_URDF Marvin_Pro_V3_URDF Skye_V4_URDF; do
  echo "[$m] $(find "$m" -mindepth 1 -maxdepth 2 -type d | wc -l | tr -d ' ') 个二级及以下目录"
done
