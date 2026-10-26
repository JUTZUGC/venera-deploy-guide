#!/usr/bin/env bash
set -euo pipefail
# Venera 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/venera-app/venera/blob/master/doc/comic_source.md
# 更新日期：2026-10-26
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

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

echo ""

echo "安装包已就绪：Windows 会直接启动；Linux 按提示执行 sudo apt install；macOS 把 dmg 里的应用拖进「应用程序」"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/venera-app/venera/blob/master/doc/comic_source.md"
