@echo off & setlocal

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Request administrator permission...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    rem del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin


set batchPath=%~dp0
@echo .
@echo .
@echo .
@echo --------------------------------------------------------------------------
@echo ---------    Restoere Default Registry value of Windows Update   ---------
@echo --------------------------------------------------------------------------
@echo .
@echo .
@echo .
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /f
if not "%ERRORLEVEL%" == "0" goto ERROR
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /f
if not "%ERRORLEVEL%" == "0" goto ERROR
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /f
if not "%ERRORLEVEL%" == "0" goto ERROR
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /f
if not "%ERRORLEVEL%" == "0" goto ERROR
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "UpdateServiceUrlAlternate" /f
if not "%ERRORLEVEL%" == "0" goto ERROR
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /f
if not "%ERRORLEVEL%" == "0" goto ERROR

pause
goto Exit

:ERROR
@echo .
@echo ....Error :  The registry file cannot be deleted. !!!!!!
@echo ....Error :  Check if the registry file exists in below location.
@echo .
@echo ....Error :  HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate
@echo ....Error :  HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU
@echo .
@echo .
pause
goto Exit

:Exit
exit