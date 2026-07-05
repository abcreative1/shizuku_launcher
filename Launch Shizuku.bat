@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM  Shizuku Launcher
REM  Launches Shizuku on a connected Android device via bundled
REM  ADB, without requiring a system-wide ADB installation.
REM ============================================================

set "SCRIPT_DIR=%~dp0"
set "ADB="

REM -------------------------------------------------------------------
REM  1. Locate the bundled adb.exe
REM     Check the script directory first, then a platform-tools\ subdir.
REM -------------------------------------------------------------------
if exist "%SCRIPT_DIR%adb.exe" (
    set "ADB=%SCRIPT_DIR%adb.exe"
) else if exist "%SCRIPT_DIR%platform-tools\adb.exe" (
    set "ADB=%SCRIPT_DIR%platform-tools\adb.exe"
) else (
    echo.
    echo [ERROR] adb.exe not found.
    echo.
    echo Make sure adb.exe is in the same folder as this script,
    echo or inside a "platform-tools" subfolder next to it.
    echo.
    pause
    exit /b 1
)

REM -------------------------------------------------------------------
REM  2. Start the ADB server (no-op if already running)
REM -------------------------------------------------------------------
echo Starting ADB server...
"%ADB%" start-server >nul 2>&1

REM -------------------------------------------------------------------
REM  3. Detect connected devices
REM -------------------------------------------------------------------
echo Checking connected devices...

set "DEVICE_COUNT=0"
set "DEVICE_STATE="
set "DEVICE_SERIAL="

for /f "skip=1 tokens=1,2" %%a in ('"%ADB%" devices 2^>nul') do (
    if not "%%b"=="" (
        set /a DEVICE_COUNT+=1
        set "DEVICE_SERIAL=%%a"
        set "DEVICE_STATE=%%b"
    )
)

REM --- No device connected ---
if %DEVICE_COUNT% equ 0 (
    echo.
    echo [ERROR] No device detected.
    echo.
    echo Make sure your device is connected via USB with USB debugging
    echo enabled, then run this script again.
    echo.
    echo Quick checklist:
    echo   - USB cable is data-capable ^(not charge-only^)
    echo   - USB mode set to "File transfer" / MTP on the device
    echo   - USB debugging enabled in Developer options
    echo   - "Allow USB debugging?" prompt accepted on the device
    echo.
    pause
    exit /b 1
)

REM --- More than one device connected ---
if %DEVICE_COUNT% gtr 1 (
    echo.
    echo [ERROR] More than one device connected.
    echo.
    echo Disconnect all other devices and keep only the target device
    echo connected, then run this script again.
    echo.
    echo Connected devices:
    "%ADB%" devices
    echo.
    pause
    exit /b 1
)

REM --- Device unauthorized ---
if /i "!DEVICE_STATE!"=="unauthorized" (
    echo.
    echo [ERROR] USB debugging not authorized.
    echo.
    echo On your device, check for an "Allow USB debugging?" prompt
    echo and tap "OK". If no prompt appears:
    echo   1. Disconnect the USB cable.
    echo   2. Go to Settings ^> Developer options.
    echo   3. Tap "Revoke USB debugging authorizations".
    echo   4. Reconnect the cable and accept the prompt.
    echo.
    pause
    exit /b 1
)

REM --- Device offline ---
if /i "!DEVICE_STATE!"=="offline" (
    echo.
    echo [ERROR] Device is offline.
    echo.
    echo Try disconnecting and reconnecting the USB cable.
    echo If the problem persists, restart your device and try again.
    echo.
    pause
    exit /b 1
)

REM --- Unexpected state ---
if /i not "!DEVICE_STATE!"=="device" (
    echo.
    echo [ERROR] Unexpected device state: !DEVICE_STATE!
    echo.
    pause
    exit /b 1
)

echo Device detected (!DEVICE_SERIAL!^).
echo Starting Shizuku...

REM -------------------------------------------------------------------
REM  4. Execute the Shizuku start command
REM -------------------------------------------------------------------
"%ADB%" shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh

if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Failed to start Shizuku.
    echo.
    echo Open the Shizuku app on your device and check for any
    echo setup instructions, then try running this launcher again.
    echo.
    pause
    exit /b 1
)

REM -------------------------------------------------------------------
REM  5. Success
REM -------------------------------------------------------------------
echo.
echo Shizuku started successfully.
echo.
pause
