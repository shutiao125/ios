# 「快记账！」本地打包资源与 iOS 云端构建

「快记账！」App 的 **uni-app 本地打包资源（Android / iOS 通用）** 托管在本仓库，并附带 iOS 端的 GitHub Actions 云端打包流水线。配套后端见 [zhang_api 仓库](https://github.com/shutiao125/zhang_api)（AI 记账识别 + 邮箱验证码）。

> 应用定位：轻量记账应用——手动记录与 AI 智能记账，账目按账号隔离。

## 双端打包策略

| 平台 | 打包方式 | 说明 |
|---|---|---|
| Android | HBuilderX 云打包 | 直接用 uni-app 源码工程云打包出 APK，不需要本仓库参与 |
| iOS | 本仓库 GitHub Actions | 基于 DCloud HBuilder-Hello 离线 SDK，由 `build-ios.yml` 执行打包 |

本地资源包 `Pandora/apps/__UNI__DAC2A70/` 是双端通用的编译产物。iOS 端因离线打包依赖证书、描述文件和 Xcode 环境，所以放在本仓库由 CI 自动完成；安卓无需如此。

## 仓库结构

| 内容 | 来源 |
|---|---|
| `SDK/` | DCloud App 离线 SDK（HBuilder-Hello 壳工程 + uniPluginDemo），大文件走 Git LFS |
| `SDK/HBuilder-Hello/HBuilder-Hello/Pandora/apps/__UNI__DAC2A70/` | **自己的 App**：「快记账！」uni-app 本地打包资源（Android / iOS 通用） |
| `.github/workflows/build-ios.yml` | **iOS 打包脚本**：执行 iOS 离线打包的 CI 流水线 |

## 技术栈

| 层次 | 技术 |
|---|---|
| 应用框架 | uni-app（Vue 语法，一套代码编译 Android / iOS 双端） |
| 开发工具 | HBuilderX（源码开发、生成打包资源、Android 云打包） |
| iOS 壳工程 | DCloud App 离线 SDK（HBuilder-Hello，Objective-C + Swift） |
| iOS 构建 | Xcode / xcodebuild（GitHub Actions macOS runner 云端执行） |
| CI/CD | GitHub Actions（`workflow_dispatch` 手动触发出包） |
| 版本管理 | Git LFS（SDK 大文件） |
| 后端服务 | FastAPI（[zhang_api 仓库](https://github.com/shutiao125/zhang_api)，AI 记账识别） |

## 云端构建（推荐）

1. 仓库 **Settings → Secrets and variables → Actions** 配置三个 Secret：

   | Secret | 内容 |
   |---|---|
   | `IOS_P12_BASE64` | 打包证书 `.p12` 文件的 base64 |
   | `P12_PASSWORD` | `.p12` 的导出密码 |
   | `IOS_PROVISIONING_PROFILE_BASE64` | 描述文件 `.mobileprovision` 的 base64 |

   base64 生成：`base64 -i 证书.p12 -o 证书.txt`

2. **Actions → Build iOS IPA → Run workflow**（`workflow_dispatch` 手动触发）
3. 构建完成后在 Artifacts 下载 **`money-app-ipa`**（未签名 IPA，可自签安装）

流水线步骤：checkout（含 LFS）→ 重写 `HBuilder-Hello-Info.plist`（规避编码问题，内含 `dcloud_appkey`）→ 导入证书与描述文件 → `xcodebuild` 关闭代码签名编译 → 收集 `.app` 打包为 IPA。

## 本地构建

```bash
# 首次克隆后拉取 LFS 大文件
git lfs pull

# 用 Xcode 打开壳工程
open SDK/HBuilder-Hello/HBuilder-Hello.xcodeproj
# 选择 HBuilder scheme 与真机目标，Product → Build
```

## 更新 App 内容

**Android**：在 uni-app 源码工程（HBuilderX）中「发行 → 原生 App-云打包」直接出 APK，与本仓库无关。

**iOS**：

1. 在 HBuilderX 中「发行 → 原生 App-本地打包 → 生成本地打包 App 资源」
2. 用产物替换 `SDK/HBuilder-Hello/HBuilder-Hello/Pandora/apps/__UNI__DAC2A70/` 目录，提交
3. 重跑 workflow 出新包

## 注意事项

- `dcloud_appkey` 写在 [build-ios.yml](.github/workflows/build-ios.yml) 重写 Info.plist 的步骤里，更换 key 需同步修改
- workflow 的 `xcodebuild` 命令内置了框架/库搜索路径与链接参数（`DCUniBase`、`DCloudUTSFoundation` 等），调整工程结构时需同步维护
- SDK 目录来自 DCloud 官方分发（含 `license.md`），升级 SDK 版本时整体替换 `SDK/` 即可
