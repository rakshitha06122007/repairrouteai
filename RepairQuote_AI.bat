@echo off
title RepairQuote AI Launcher
echo ===================================================
echo        RepairQuote AI - Startup Launcher
echo       "Know the repair before you pay"
echo ===================================================
echo.

cd /d "C:\Users\raksh\.gemini\antigravity-ide\scratch\repairquote-ai"

:: Check if server is responding on port 8080
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:8080' -TimeoutSec 1; exit 0 } catch { exit 1 }" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Starting local web server on port 8080...
    start /b py -m http.server 8080
    timeout /t 1 >nul
) else (
    echo Local web server is already active!
)

echo Opening RepairQuote AI in Google Chrome...
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" "http://localhost:8080"
) else (
    start "" "http://localhost:8080"
)

echo Done! RepairQuote AI is now running.
timeout /t 2 >nul
exit
