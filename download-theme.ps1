Write-Host "Downloading PaperMod theme..." -ForegroundColor Yellow

$zipUrl = "https://github.com/adityatelange/hugo-PaperMod/archive/refs/heads/master.zip"
$zipFile = "PaperMod.zip"
$extractPath = "themes"

if (-not (Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath | Out-Null
}

try {
    Write-Host "Downloading from GitHub..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile -UseBasicParsing
    
    Write-Host "Extracting..." -ForegroundColor Cyan
    Expand-Archive -Path $zipFile -DestinationPath $extractPath -Force
    
    if (Test-Path "themes/PaperMod") {
        Remove-Item -Path "themes/PaperMod" -Recurse -Force
    }
    
    Rename-Item -Path "themes/hugo-PaperMod-master" -NewName "PaperMod"
    
    Remove-Item -Path $zipFile -Force
    
    Write-Host "Success! Theme installed to themes/PaperMod" -ForegroundColor Green
    Write-Host "You can now run: hugo server -D" -ForegroundColor Yellow
    
} catch {
    Write-Host "Download failed: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Manual solution:" -ForegroundColor Yellow
    Write-Host "1. Download: $zipUrl" -ForegroundColor White
    Write-Host "2. Extract to themes/PaperMod" -ForegroundColor White
}
