@echo off
echo ====================================
echo Hugo 网站构建脚本
echo ====================================
echo.
echo 正在构建网站...
hugo --minify
echo.
if %ERRORLEVEL% EQU 0 (
    echo ✓ 构建成功！
    echo 生成的文件在 public/ 目录
) else (
    echo ✗ 构建失败，请检查错误信息
)
echo.
pause
