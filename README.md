# robot-assets

天机机器人（tianjizn）机器人模型资源仓库，收录 URDF / MJCF 模型与网格（mesh）文件。

## 资源目录

| 目录 | 机型 | 说明 |
|------|------|------|
| `双臂_URDF/` | Marvin M6 Lite / M6 SRS / M20 / M6 CCS | 双臂系列，174 个 STL |
| `Luna_V3_URDF/` | Gento Luna V3.0（750/680 臂展） | 1085 个 STL |
| `Pro_V3_URDF/` | Marvin Pro V3.0（696/809/615） | 350 个 STL |
| `Skye_V4_URDF/` | Gento Skye V4.0（696/920 臂长） | 808 个 STL |

## 获取资源（推荐：通过 Release）

模型网格体积较大，已按机型打包为压缩包，随 [GitHub Release](https://github.com/tianjizn/robot-assets/releases) 发布。

```bash
# 安装 GitHub CLI 后下载

# 全量下载最新版本
gh release download v2026.11.11

# 只下载某个机型
gh release download v2026.11.11 -p 'Luna_V3*'
```

也可以直接在 [Releases 页面](https://github.com/tianjizn/robot-assets/releases) 手动下载对应 `.tar.gz` 文件。

## 许可证

本仓库的资源文件基于 [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) 许可。详见 [LICENSE](LICENSE) 文件。

Copyright © 2026 tianjizn.
