@echo off
echo Stopping any running Hugo servers...
taskkill /F /IM hugo.exe 2>nul
timeout /t 2 /nobreak >nul
echo.
echo Starting Hugo server...
echo.
echo Open http://localhost:1313 in your browser
echo Press Ctrl+C to stop
echo.
hugo server -D
