@echo off
title VibaTime — Desktop Shortcut Setup
cd /d "%~dp0"

echo [VibaTime] Creating desktop shortcut with custom icon...

:: Create VBScript to make shortcut
set "VBSPATH=%TEMP%\make_shortcut.vbs"
set "APP_DIR=%~dp0"
set "DESKTOP=%USERPROFILE%\Desktop"
set "ICON_PATH=%APP_DIR%build\icon.ico"

(
echo Set oWS = WScript.CreateObject^("WScript.Shell"^)
echo sLinkFile = "%DESKTOP%\VibaTime.lnk"
echo Set oLink = oWS.CreateShortcut^(sLinkFile^)
echo oLink.TargetPath = "%APP_DIR%launch.vbs"
echo oLink.WorkingDirectory = "%APP_DIR%"
echo oLink.Description = "VibaTime — Premium Clock with Pomodoro and Music"
echo oLink.IconLocation = "%ICON_PATH%,0"
echo oLink.WindowStyle = 1
echo oLink.Save
) > "%VBSPATH%"

cscript //nologo "%VBSPATH%"
del "%VBSPATH%"

echo.
echo [VibaTime] Desktop shortcut created successfully!
echo The icon should now appear correctly on your desktop.
echo.
echo If the icon doesn't update immediately, try right-clicking the desktop and selecting 'Refresh'.
echo.
pause
