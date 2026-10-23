@echo off
echo Uninstalling RustDeskQS...

set "INSTALL_DIR=C:\Program Files\RustDeskQS"
set "ALL_USERS=C:\Documents and Settings\All Users"

:: 1. Kill the program safely
taskkill /f /im rustdeskqs.exe >nul 2>&1

:: 2. Remove all shortcuts
echo Removing shortcuts...
if exist "%ALL_USERS%\Desktop\RustDeskQS.lnk" del /f /q "%ALL_USERS%\Desktop\RustDeskQS.lnk"
if exist "%ALL_USERS%\Start Menu\Programs\RustDeskQS.lnk" del /f /q "%ALL_USERS%\Start Menu\Programs\RustDeskQS.lnk"
if exist "%ALL_USERS%\Start Menu\Programs\RustDeskQS_Uninstall.lnk" del /f /q "%ALL_USERS%\Start Menu\Programs\RustDeskQS_Uninstall.lnk"
if exist "%ALL_USERS%\Start Menu\Programs\Startup\RustDeskQS.lnk" del /f /q "%ALL_USERS%\Start Menu\Programs\Startup\RustDeskQS.lnk"

:: Cleanup old Start Menu folders from previous attempts
if exist "%ALL_USERS%\Start Menu\Programs\RustDeskQS" rmdir /s /q "%ALL_USERS%\Start Menu\Programs\RustDeskQS"

:: 3. Remove program files using the self-delete trick
echo Removing program files...

set "TEMPBAT=%TEMP%\RustDesk_Cleanup.bat"
echo @echo off > "%TEMPBAT%"
:: Ping localhost creates a 2-second delay to let this main script exit and release the file lock
echo ping 127.0.0.1 -n 3 ^> nul >> "%TEMPBAT%"
echo rmdir /s /q "%INSTALL_DIR%" >> "%TEMPBAT%"
:: %%~f0 tells the temp batch file to delete itself when finished
echo del "%%~f0" >> "%TEMPBAT%"

:: Start the temp batch file in the background and immediately exit this one
start /b "" "%TEMPBAT%"
exit

