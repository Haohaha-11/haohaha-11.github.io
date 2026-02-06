# Hugo 学术网站初始化脚本

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Hugo 学术网站初始化脚本" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Hugo 是否安装
Write-Host "检查 Hugo 安装状态..." -ForegroundColor Yellow
$hugoInstalled = Get-Command hugo -ErrorAction SilentlyContinue

if (-not $hugoInstalled) {
    Write-Host "❌ Hugo 未安装" -ForegroundColor Red
    Write-Host ""
    Write-Host "请运行以下命令安装 Hugo Extended：" -ForegroundColor Yellow
    Write-Host "  winget install Hugo.Hugo.Extended" -ForegroundColor Green
    Write-Host ""
    Write-Host "安装完成后，请重启终端并重新运行此脚本。" -ForegroundColor Yellow
    exit 1
} else {
    $hugoVersion = hugo version
    Write-Host "✅ Hugo 已安装: $hugoVersion" -ForegroundColor Green
}

Write-Host ""

# 检查 Git 是否安装
Write-Host "检查 Git 安装状态..." -ForegroundColor Yellow
$gitInstalled = Get-Command git -ErrorAction SilentlyContinue

if (-not $gitInstalled) {
    Write-Host "❌ Git 未安装" -ForegroundColor Red
    Write-Host "请先安装 Git: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
} else {
    Write-Host "✅ Git 已安装" -ForegroundColor Green
}

Write-Host ""

# 初始化 Git 仓库
if (-not (Test-Path ".git")) {
    Write-Host "初始化 Git 仓库..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git 仓库初始化完成" -ForegroundColor Green
} else {
    Write-Host "✅ Git 仓库已存在" -ForegroundColor Green
}

Write-Host ""

# 添加 PaperMod 主题
if (-not (Test-Path "themes/PaperMod/.git")) {
    Write-Host "添加 PaperMod 主题..." -ForegroundColor Yellow
    git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
    git submodule update --init --recursive
    Write-Host "✅ PaperMod 主题添加完成" -ForegroundColor Green
} else {
    Write-Host "✅ PaperMod 主题已存在" -ForegroundColor Green
    Write-Host "更新主题..." -ForegroundColor Yellow
    git submodule update --remote --merge
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "初始化完成！" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "下一步操作：" -ForegroundColor Yellow
Write-Host "1. 编辑 hugo.yaml 配置个人信息" -ForegroundColor White
Write-Host "2. 将头像放到 static/img/avatar.jpg" -ForegroundColor White
Write-Host "3. 运行 'hugo server -D' 预览网站" -ForegroundColor White
Write-Host "4. 访问 http://localhost:1313" -ForegroundColor White
Write-Host ""
Write-Host "详细配置说明请查看 SETUP.md 文件" -ForegroundColor Cyan
Write-Host ""

# 询问是否立即启动预览服务器
$response = Read-Host "是否现在启动预览服务器？(Y/N)"
if ($response -eq "Y" -or $response -eq "y") {
    Write-Host ""
    Write-Host "启动 Hugo 开发服务器..." -ForegroundColor Yellow
    Write-Host "按 Ctrl+C 停止服务器" -ForegroundColor Yellow
    Write-Host ""
    hugo server -D
}
