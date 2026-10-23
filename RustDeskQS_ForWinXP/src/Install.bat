@echo off
echo Installing RustDeskQS...

:: 1. Create the installation folder
set "INSTALL_DIR=C:\Program Files\RustDeskQS"
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

:: 2. Copy all files from the current folder to the installation folder
echo Copying files...
copy /Y "*.*" "%INSTALL_DIR%\"

:: 3. Copy the shortcut to All Users Start Menu and Desktop
echo Creating shortcuts...
set "ALL_USERS=C:\Documents and Settings\All Users"
copy /Y "RustDeskQS.lnk" "%ALL_USERS%\Start Menu\Programs\"
copy /Y "RustDeskQS.lnk" "%ALL_USERS%\Desktop\"

goto :RUN
:: 4. Prompt for automatic startup
set /p AUTOSTART="Would you like RustDeskQS to start automatically on boot? (Y/N): "
if /I "%AUTOSTART%"=="Y" (
    copy /Y "RustDeskQS.lnk" "%ALL_USERS%\Start Menu\Programs\Startup\"
    echo Added to Startup.
)

:RUN
echo Installation complete!

Start "" "%INSTALL_DIR%\RustDeskQS.exe" 
