#RequireAdmin

Global $sInstallDir = @ProgramFilesDir & "\RustDeskQS"

; 1. Create the installation folder
DirCreate($sInstallDir)

; 2. Extract embedded files to the user's PC
FileInstall("RustDeskQS.exe", $sInstallDir & "\RustDeskQS.exe", 1)
FileInstall("rustdesk_cpp_host.ini", $sInstallDir & "\rustdesk_cpp_host.ini", 1)
FileInstall("en.txt", $sInstallDir & "\en.txt", 1)
FileInstall("tw.txt", $sInstallDir & "\tw.txt", 1)
FileInstall("UnInstall.bat", $sInstallDir & "\UnInstall.bat", 1)

; 3. Create shortcuts natively using the correct macros
FileCreateShortcut($sInstallDir & "\RustDeskQS.exe", @ProgramsCommonDir & "\RustDeskQS.lnk")
FileCreateShortcut($sInstallDir & "\RustDeskQS.exe", @DesktopCommonDir & "\RustDeskQS.lnk")

; Optional: Create a shortcut for the Uninstaller in the Start Menu
FileCreateShortcut($sInstallDir & "\UnInstall.bat", @ProgramsCommonDir & "\RustDeskQS_Uninstall.lnk")

; 4. Launch the application
Run('"' & $sInstallDir & '\RustDeskQS.exe"')


; Original Project https://github.com/Terence0816/RustDesk-QuickHost