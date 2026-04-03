@echo off
title VibaTime
cd /d "%~dp0"

:: Check if node_modules exists
if not exist "node_modules\" (
  echo [VibaTime] Installing dependencies...
  npm install
  if errorlevel 1 (
    echo ERROR: npm install failed. Make sure Node.js is installed.
    pause
    exit /b 1
  )
)

echo [VibaTime] Starting...
npm start
