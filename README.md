# robot-assets

天机机器人（tianjizn）机器人模型资源仓库，收录 URDF / MJCF 模型与网格（mesh）文件。

模型网格体积较大，**推荐通过 [GitHub Releases](https://github.com/tianjizn/robot-assets/releases) 按需下载**，不需要克隆整个仓库。

## 机型与 Release 对应关系

每个机型一个独立 Release（tag = 机型名），按机型各自迭代更新；每个 Release 内按**变体**拆成独立的 `.tar.gz` 包，一个变体一个包，按需下载。

| 机型 | Release tag | 变体包数 | 合计体积 |
|------|-------------|---------|---------|
| Gento Luna V3.0 | [`Luna_V3_URDF`](https://github.com/tianjizn/robot-assets/releases/tag/Luna_V3_URDF) | 15 | 638 MB |
| Marvin 双臂 | [`Marvin_Dual-arm_URDF`](https://github.com/tianjizn/robot-assets/releases/tag/Marvin_Dual-arm_URDF) | 4 | 101 MB |
| Marvin Pro V3.0 | [`Marvin_Pro_V3_URDF`](https://github.com/tianjizn/robot-assets/releases/tag/Marvin_Pro_V3_URDF) | 12 | 278 MB |
| Gento Skye V4.0 | [`Skye_V4_URDF`](https://github.com/tianjizn/robot-assets/releases/tag/Skye_V4_URDF) | 15 | 499 MB |

> 更新规则：同一机型更新时新建 `<机型>-<YYYYMMDD>` tag（如 `Luna_V3_URDF-20261119`），历史 Release 保留可回滚。

## 下载方式

### 方式一：GitHub CLI（推荐，支持单包/批量）

```bash
# 安装：brew install gh  （然后 gh auth login）

# 下载某机型全部变体
gh release download Luna_V3_URDF

# 只下某个变体（pattern 支持通配）
gh release download Luna_V3_URDF -p 'Gento_Luna_V3.0_M6SLite_750*'

# 只列出有哪些包，不下载
gh release view Luna_V3_URDF
```

### 方式二：浏览器

打开对应 [Release 页面](https://github.com/tianjizn/robot-assets/releases)，点击所需 `.tar.gz` 下载。

### 解压

```bash
tar -xzf Gento_Luna_V3.0_M6SLite_750.tar.gz
# 解压得到同名目录，内含 urdf/、MJCF/、meshes/
```

## 变体清单

<details>
<summary><b>Luna_V3_URDF</b>（Gento Luna V3.0，15 个变体）</summary>

| 变体包 | 臂长 |
|--------|------|
| `Gento_Luna_V3.0_M6SLite_615` | 615 |
| `Gento_Luna_V3.0_M6SLite_615_D405GA` | 615 + D405GA 相机 |
| `Gento_Luna_V3.0_M6SLite_615_D405GA_Gripper` | 615 + D405GA + 夹爪 |
| `Gento_Luna_V3.0_M6SLite_615_SHW5G` | 615 + SHW5G 相机 |
| `Gento_Luna_V3.0_M6SLite_615_SHW5G_Gripper` | 615 + SHW5G + 夹爪 |
| `Gento_Luna_V3.0_M6SLite_680` | 680 |
| `Gento_Luna_V3.0_M6SLite_680_D405GA` | 680 + D405GA |
| `Gento_Luna_V3.0_M6SLite_680_D405GA_Gripper` | 680 + D405GA + 夹爪 |
| `Gento_Luna_V3.0_M6SLite_680_SHW5G` | 680 + SHW5G |
| `Gento_Luna_V3.0_M6SLite_680_SHW5G_Gripper` | 680 + SHW5G + 夹爪 |
| `Gento_Luna_V3.0_M6SLite_750` | 750 |
| `Gento_Luna_V3.0_M6SLite_750_D405GA` | 750 + D405GA |
| `Gento_Luna_V3.0_M6SLite_750_D405GA_Gripper` | 750 + D405GA + 夹爪 |
| `Gento_Luna_V3.0_M6SLite_750_SHW5G` | 750 + SHW5G |
| `Gento_Luna_V3.0_M6SLite_750_SHW5G_Gripper` | 750 + SHW5G + 夹爪 |

</details>

<details>
<summary><b>Marvin_Dual-arm_URDF</b>（Marvin 双臂，4 个变体）</summary>

| 变体包 | 说明 |
|--------|------|
| `M6_Lite` | M6S-Lite CCS 系列（615 / 680 / 750，含灵巧手与标准款） |
| `M6_SRS` | M6-S SRS 系列（686，左右臂） |
| `M6_CCS` | M6/M3-S CCS 系列（696 / 920，左右臂） |
| `M20` | M20S CCS 系列（1050 / 1400，左右臂） |

</details>

<details>
<summary><b>Marvin_Pro_V3_URDF</b>（Marvin Pro V3.0，12 个变体）</summary>

| 变体包 | 臂长 | 末端 |
|--------|------|------|
| `Marvin_pro_V3.0_M6SLite_615_D405GA` | 615 | D405GA 相机 |
| `Marvin_pro_V3.0_M6SLite_615_D405GA_TJgripper` | 615 | D405GA + TJ 夹爪 |
| `Marvin_pro_V3.0_M6SLite_615_SHW5G` | 615 | SHW5G 相机 |
| `Marvin_pro_V3.0_M6SLite_615_SHW5G_TJgripper` | 615 | SHW5G + TJ 夹爪 |
| `Marvin_pro_V3.0_M6_696_D405GA` | 696 | D405GA 相机 |
| `Marvin_pro_V3.0_M6_696_D405GA_TJgripper` | 696 | D405GA + TJ 夹爪 |
| `Marvin_pro_V3.0_M6_696_SHW5G` | 696 | SHW5G 相机 |
| `Marvin_pro_V3.0_M6_696_SHW5G_TJgripper` | 696 | SHW5G + TJ 夹爪 |
| `Marvin_pro_V3.0_M6_809_D405GA` | 809 | D405GA 相机 |
| `Marvin_pro_V3.0_M6_809_D405GA_TJgripper` | 809 | D405GA + TJ 夹爪 |
| `Marvin_pro_V3.0_M6_809_SHW5G` | 809 | SHW5G 相机 |
| `Marvin_pro_V3.0_M6_809_SHW5G_TJgripper` | 809 | SHW5G + TJ 夹爪 |

</details>

<details>
<summary><b>Skye_V4_URDF</b>（Gento Skye V4.0，15 个变体）</summary>

| 变体包 | 臂长 |
|--------|------|
| `Gento_Skye_V4.0_M6S_696` | 696 |
| `Gento_Skye_V4.0_M6S_696_D405GA` | 696 + D405GA |
| `Gento_Skye_V4.0_M6S_696_D405GA_Gripper` | 696 + D405GA + 夹爪 |
| `Gento_Skye_V4.0_M6S_696_SHW5G` | 696 + SHW5G |
| `Gento_Skye_V4.0_M6S_696_SHW5G_Gripper` | 696 + SHW5G + 夹爪 |
| `Gento_Skye_V4.0_M6S_809` | 809 |
| `Gento_Skye_V4.0_M6S_809_D405GA` | 809 + D405GA |
| `Gento_Skye_V4.0_M6S_809_D405GA_Gripper` | 809 + D405GA + 夹爪 |
| `Gento_Skye_V4.0_M6S_809_SHW5G` | 809 + SHW5G |
| `Gento_Skye_V4.0_M6S_809_SHW5G_Gripper` | 809 + SHW5G + 夹爪 |
| `Gento_Skye_V4.0_M3S_920` | 920 |
| `Gento_Skye_V4.0_M3S_920_D405GA` | 920 + D405GA |
| `Gento_Skye_V4.0_M3S_920_D405GA_Gripper` | 920 + D405GA + 夹爪 |
| `Gento_Skye_V4.0_M3S_920_SHW5G` | 920 + SHW5G |
| `Gento_Skye_V4.0_M3S_920_SHW5G_Gripper` | 920 + SHW5G + 夹爪 |

</details>

## 命名规则

```
Gento_Luna_V3.0_M6SLite_750_D405GA_Gripper
└─品牌─┘ └机型┘ └关节规格┘ └臂长┘ └─末端配置─┘
```

| 字段 | 取值 | 含义 |
|------|------|------|
| 关节规格 | `M6SLite` / `M6` / `M6S` / `M3S` | 关节型号 |
| 臂长 | `615` / `680` / `750` / `696` / `809` / `920` / `1050` / `1400` | 臂展（mm） |
| 相机 | `D405GA` / `SHW5G` | 腕部相机型号，缺省表示无相机变体 |
| 夹爪 | `Gripper` / `TJgripper` | 末端夹爪，缺省表示标准法兰 |

## 仓库目录

仓库同时保留完整的模型文件树，供需要直接浏览源码（URDF/MJCF 文本、STL 网格）的场景使用：

| 目录 | 对应 Release | 内部层级 |
|------|--------------|---------|
| `Luna_V3_URDF/` | `Luna_V3_URDF` | `615臂展/` `680臂展/` `750臂展/` → 各变体 |
| `双臂_URDF/` | `Marvin_Dual-arm_URDF` | `M6 Lite/` `M6 SRS/` `M6 CCS/` `M20/` → 各变体 |
| `Pro_V3_URDF/` | `Marvin_Pro_V3_URDF` | `M6_696/` `M6_809/` `M6SLite_615/` → 各变体 |
| `Skye_V4_URDF/` | `Skye_V4_URDF` | `696臂长系列/` `809臂长系列/` `920臂长系列/` → 各变体 |

> 仓库目录与 Release 包内容一致，只是层级组织方式不同（Release 包已拍平中间层，一个变体一个包）。日常使用建议直接下载 Release 包，避免 clone 大量二进制文件。

## 许可证

本仓库的资源文件基于 [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) 许可。详见 [LICENSE](LICENSE) 文件。

Copyright © 2026 tianjizn.
