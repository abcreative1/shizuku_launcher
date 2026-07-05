# Shizuku Launcher

A lightweight Windows batch-file launcher that starts [Shizuku](https://shizuku.rikka.app/) on your Android device using a bundled copy of ADB — no typing commands, no opening Command Prompt.

## What It Does

Double-click `Launch Shizuku.bat` and it:

1. Finds the bundled `adb.exe`
2. Starts the ADB server
3. Checks that your phone is connected and ready
4. Starts Shizuku on your phone
5. Shows a clear success or error message

## Folder Structure

```
ShizukuLauncher/
├── Launch Shizuku.bat    ← the launcher (double-click this)
├── README.md             ← this file
├── README.txt            ← plain-text instructions
└── platform-tools\       ← ADB binaries (from Google)
    ├── adb.exe
    ├── AdbWinApi.dll
    └── AdbWinUsbApi.dll
```

## Setup (One Time Only)

### 1. Install Shizuku on your phone

Get it from [Google Play](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api) or [F-Droid](https://f-droid.org/packages/moe.shizuku.privileged.api/).

### 2. Enable Developer Options

```
Settings → About phone → Tap "Build number" 7 times
```

### 3. Enable USB Debugging

```
Settings → Developer options → USB debugging → ON
```

### 4. Prepare the launcher folder

[Download the Platform Tools](https://developer.android.com/studio/releases/platform-tools) from Google, extract the ZIP, and copy these three files into the `ShizukuLauncher` folder:

- `adb.exe`
- `AdbWinApi.dll`
- `AdbWinUsbApi.dll`

## How to Use

1. Connect your phone to your computer via USB
2. On your phone, tap **OK** on the "Allow USB debugging?" prompt
3. Set USB mode to **File transfer / MTP** (pull down the notification shade)
4. Double-click `Launch Shizuku.bat`
5. Wait for "Shizuku started successfully"

That's it. Close the window — Shizuku is now running.

## Troubleshooting

| Message | What to do |
|---------|-----------|
| `adb.exe not found` | Make sure `adb.exe`, `AdbWinApi.dll`, and `AdbWinUsbApi.dll` are in the same folder as the batch file. |
| `No device detected` | Check USB cable (use a data cable, not charge-only), enable USB debugging, set USB mode to File transfer. |
| `USB debugging not authorized` | Look at your phone for the "Allow USB debugging?" prompt and tap OK. If missing, go to Developer options → Revoke USB debugging authorizations → reconnect. |
| `Device is offline` | Unplug and replug the USB cable. Restart your phone if it persists. |
| `More than one device connected` | Disconnect all other Android devices from your computer. |
| `Failed to start Shizuku` | Make sure Shizuku is installed and you've opened the app at least once. |

## Requirements

- Windows 7, 8, 10, or 11
- No administrator privileges needed
- No system-wide ADB installation required — the launcher uses its own bundled copy
