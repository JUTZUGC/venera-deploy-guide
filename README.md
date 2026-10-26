# Venera 一键安装指南

> 第三方部署指南 · 非 Venera 官方仓库。官方项目：[venera-app/venera](https://github.com/venera-app/venera)
> 内容来自官方文档（2026-10-26）。项目迭代快，请以[官方文档](https://github.com/venera-app/venera/blob/master/doc/comic_source.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用自己找安装包，让百度搭子按你的系统下载、校验并装好。

⚠️ 电脑端支持 Windows / macOS / Linux；Windows 全自动，macOS / Linux 下载校验后需最后一步确认。手机端需手动装 APK，iOS 需 AltStore 侧载。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/venera-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按你的系统下载对应的官方安装包、校验 SHA256，并完成安装或解压，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## Venera 是什么？

Venera 是开源的支持本地与网络源的跨平台漫画阅读器（协议：GPL-3.0，<img src="https://img.shields.io/github/stars/venera-app/venera?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

支持读取本地漫画与网络源，漫画源用 JavaScript 编写、可通过源列表 URL 批量导入；自带收藏管理、下载、评论与标签查看，覆盖桌面与移动端。

- 跨平台：Windows / macOS / Linux / Android / iOS 均有官方构建
- 漫画源用 JS 编写，可通过源列表 URL 批量导入
- 支持本地漫画、收藏管理、下载、评论与标签
- GPL-3.0，代码完全开源

（来源：[官方仓库](https://github.com/venera-app/venera)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 跨平台完整 | Windows / macOS / Linux / Android / iOS 都有官方构建 |
| 源系统灵活 | 漫画源用 JavaScript 编写，可通过源列表 URL 批量导入 |
| 功能齐全 | 本地漫画、收藏、下载、评论、标签一应俱全 |
| GPL-3.0 开源 | 代码与构建脚本全部公开 |

| 需要注意 | 说明 |
|---|---|
| 项目已归档 | 仓库已归档（archived），不再接收更新；安装包与源列表仍可用 |
| 依赖第三方源 | 网络漫画源由社区提供，可能随时失效 |
| 桌面端并非全平台自动 | 只有 Windows 全自动；macOS / Linux 需最后一步确认 |
| iOS 门槛高 | 必须自签名或用 AltStore 侧载，普通用户不易完成 |

> 以上基于官方文档与社区反馈整理（2026-10-26），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
case "$(uname -s)" in
  Darwin)
    curl -fL -o venera.dmg "https://github.com/venera-app/venera/releases/download/v1.6.3/venera-1.6.3+163.dmg"
    echo "f814fc4ae2d60a3abdb4e08de22e2cce49d2f63e8fdac842c93a2c9eae3425b3  venera.dmg" | shasum -a 256 -c -
    open venera.dmg
    echo "把 dmg 里的 Venera 拖进「应用程序」即可完成安装"
    ;;
  Linux)
    case "$(uname -m)" in
      aarch64|arm64) f=venera_1.6.3_arm64.deb; sum=6b9eb848ec409e8e4fe15d54ef772206ffe31bcc2c0499b476b744d52be3fe86 ;;
      *) f=venera_1.6.3_amd64.deb; sum=c34f1ebed62dfcafe78dc83413347581dfdb90f144d2125fecfd5c2cd440805c ;;
    esac
    curl -fL -o "$f" "https://github.com/venera-app/venera/releases/download/v1.6.3/$f"
    echo "$sum  $f" | sha256sum -c -
    echo "安装：sudo apt install ./$f（Debian/Ubuntu；Arch 可用 AUR venera-bin）"
    ;;
  *)
    echo "此脚本用于 Linux / macOS；Windows 请运行 deploy.ps1"; exit 1
    ;;
esac
```

安装包来源：[https://github.com/venera-app/venera/releases/tag/v1.6.3](https://github.com/venera-app/venera/releases/tag/v1.6.3)

## 验证状态

| 场景 | 状态 |
|---|---|
| Windows 下载 + SHA256 校验 + 解压 | 已验证 2026-10-24 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供各平台安装包选择、安装步骤与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-26）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\venera-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后：添加漫画源

Venera 本身不带漫画源，需要在应用内导入源列表。官方维护的源列表地址：

```
https://cdn.jsdelivr.net/gh/venera-app/venera-configs@main/index.json
```

在应用内「漫画源」页面添加该地址即可拉取。

手机端：

- Android：从 [Releases](https://github.com/venera-app/venera/releases/tag/v1.6.3) 下载 APK，按 CPU 架构选择或用 universal 包
- iOS：通过官方 [AltStore 源](https://raw.githubusercontent.com/venera-app/venera/master/alt_store.json) 侧载

> 漫画源由第三方提供，可用性与内容合规性取决于各源，请遵守当地法律与各站点条款。

## 常见坑

- 应用本身不带漫画源，安装后需要在「漫画源」页面导入源列表
- 第三方源可能失效或内容不合规，请自行判断并遵守当地法律
- Linux 的 deb 安装需要 sudo；Arch 可用 AUR 的 venera-bin 或 pkg.tar.zst 包
- macOS 若提示无法验证开发者，到「系统设置 → 隐私与安全性」里放行
- iOS 需要 AltStore 或自签名侧载，App Store 搜不到
- 仓库已归档，遇到问题不会有官方修复，建议保留旧版本安装包

## 免责声明

本仓库为第三方指南，与 Venera 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-26），项目迭代快，请以[官方文档](https://github.com/venera-app/venera/blob/master/doc/comic_source.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
