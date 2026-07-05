╔══════════════════════════════════════════════════════════════╗
║                    Shizuku Launcher                         ║
╚══════════════════════════════════════════════════════════════╝

WHAT THIS DOES
===============
This launcher helps you start Shizuku on your Android phone
without typing any commands. Just double-click the batch file.

WHAT YOU NEED
==============
- A Windows computer
- Your Android phone
- A USB cable (the one that came with your phone works best)
- The Shizuku app installed on your phone
  (get it from Google Play Store or F-Droid)

SETUP - ONE TIME ONLY
=====================
1. On your phone, enable Developer Options:
   Settings > About phone > Tap "Build number" 7 times

2. Turn on USB debugging:
   Settings > Developer options > USB debugging > ON

3. Connect your phone to the computer using the USB cable.

4. On your phone, when asked "Allow USB debugging?",
   tap OK and check "Always allow from this computer".

5. Open the Shizuku app on your phone at least once.
   (This creates a file the launcher needs.)

HOW TO USE
===========
1. Connect your phone to the computer via USB.

2. Double-click "Launch Shizuku.bat".

3. Wait for the "Shizuku started successfully" message.

4. Done! You can close the window. Shizuku is now running.

WHAT THE SCREEN WILL SHOW
=========================
  Starting ADB server...
  Checking connected devices...
  Device detected (XXXXXXXXXXXX).
  Starting Shizuku...
  Shizuku started successfully.

If something goes wrong, the screen will tell you what the
problem is and how to fix it.

PROBLEMS?
=========
"adb.exe not found"
   Make sure you have all the files from the download.
   You need: adb.exe, AdbWinApi.dll, AdbWinUsbApi.dll

"No device detected"
   - Make sure your phone is plugged in.
   - Make sure USB debugging is turned on.
   - Try a different USB port or cable.
   - Some cables only charge and don't transfer data.

"USB debugging not authorized"
   - Look at your phone screen. Tap "OK" on the prompt.
   - If no prompt shows, go to Settings > Developer options
     > Revoke USB debugging authorizations, then reconnect.

"Device is offline"
   - Unplug and plug your phone back in.
   - Restart your phone.
   - Restart your computer.

"More than one device connected"
   - Only connect one phone at a time.
   - Disconnect any other Android devices.

"Failed to start Shizuku"
   - Make sure Shizuku is installed on your phone.
   - Open the Shizuku app at least once.
