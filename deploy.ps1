# Venera 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/venera-app/venera/blob/master/doc/comic_source.md
# 更新日期：2026-10-26
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

$zip = 'Venera-1.6.3-windows.zip'
Invoke-WebRequest -Uri "https://github.com/venera-app/venera/releases/download/v1.6.3/$zip" -OutFile $zip -UseBasicParsing
if ((Get-FileHash $zip -Algorithm SHA256).Hash.ToLower() -ne '5b83b58bc4111ee8fdc40034e0a73a236ec6bae1f891838353dd3ef81ff66aa4') { throw 'SHA256 校验失败' }
Expand-Archive $zip -DestinationPath venera -Force
Start-Process (Join-Path $PWD 'venera\venera.exe')

Write-Host ''

Write-Host '安装包已就绪：Windows 会直接启动；Linux 按提示执行 sudo apt install；macOS 把 dmg 里的应用拖进「应用程序」'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/venera-app/venera/blob/master/doc/comic_source.md'
