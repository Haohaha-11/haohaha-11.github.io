# PaperMod 主题安装脚本（多种方法）

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "PaperMod 主题安装脚本" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# 创建 themes 目录
if (-not (Test-Path "themes")) {
    New-Item -ItemType Directory -Path "themes" | Out-Null
}

# 方法列表
$methods = @(
    @{
        Name = "GitHub 官方源"
        Url = "https://github.com/adityatelange/hugo-PaperMod.git"
    },
    @{
        Name = "GitHub 镜像源 (ghproxy.com)"
        Url = "https://ghproxy.com/https://github.com/adityatelange/hugo-PaperMod.git"
    },
    @{
        Name = "Gitee 镜像"
        Url = "https://gitee.com/mirrors/hugo-PaperMod.git"
    }
)

$success = $false

foreach ($method in $methods) {
    Write-Host "尝试方法: $($method.Name)" -ForegroundColor Yellow
    Write-Host "URL: $($method.Url)" -ForegroundColor Gray
    
    # 清理可能存在的失败目录
    if (Test-Path "themes/PaperMod") {
        Remove-Item -Path "themes/PaperMod" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    try {
        $result = git clone --depth=1 $method.Url themes/PaperMod 2>&1
        
        if ($LASTEXITCODE -eq 0 -and (Test-Path "themes/PaperMod/.git")) {
            Write-Host "✅ 成功！使用 $($method.Name) 下载完成" -ForegroundColor Green
            $success = $true
            break
        }
    } catch {
        Write-Host "❌ 失败: $_" -ForegroundColor Red
    }
    
    Write-Host ""
}

if (-not $success) {
    Write-Host ""
    Write-Host "==================================" -ForegroundColor Red
    Write-Host "所有自动安装方法都失败了" -ForegroundColor Red
    Write-Host "==================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "可能的原因：" -ForegroundColor Yellow
    Write-Host "1. 网络连接问题（防火墙、代理设置）" -ForegroundColor White
    Write-Host "2. GitHub 访问受限" -ForegroundColor White
    Write-Host ""
    Write-Host "手动解决方案：" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "方案 1: 配置 Git 代理（如果你有代理）" -ForegroundColor Cyan
    Write-Host "  git config --global http.proxy http://127.0.0.1:7890" -ForegroundColor Gray
    Write-Host "  git config --global https.proxy http://127.0.0.1:7890" -ForegroundColor Gray
    Write-Host "  然后重新运行此脚本" -ForegroundColor Gray
    Write-Host ""
    Write-Host "方案 2: 手动下载主题" -ForegroundColor Cyan
    Write-Host "  1. 访问: https://github.com/adityatelange/hugo-PaperMod/archive/refs/heads/master.zip" -ForegroundColor Gray
    Write-Host "  2. 下载并解压到 themes/PaperMod 目录" -ForegroundColor Gray
    Write-Host "  3. 确保目录结构为: themes/PaperMod/layouts/..." -ForegroundColor Gray
    Write-Host ""
    Write-Host "方案 3: 使用 Hugo Modules（推荐）" -ForegroundColor Cyan
    Write-Host "  修改 hugo.yaml，添加：" -ForegroundColor Gray
    Write-Host "  module:" -ForegroundColor Gray
    Write-Host "    imports:" -ForegroundColor Gray
    Write-Host "      - path: github.com/adityatelange/hugo-PaperMod" -ForegroundColor Gray
    Write-Host ""
    
    exit 1
} else {
    Write-Host ""
    Write-Host "==================================" -ForegroundColor Green
    Write-Host "主题安装成功！" -ForegroundColor Green
    Write-Host "==================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "现在可以运行: hugo server -D" -ForegroundColor Yellow
}
