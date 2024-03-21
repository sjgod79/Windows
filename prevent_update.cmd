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
@echo -----------------------------------------------------------------------------------
@echo ---------    Change Register Configuration for Disabled Windodws Update   ---------
@echo -----------------------------------------------------------------------------------
@echo .
@echo .
@echo .
@echo set registry "DoNotConnectToWindowsUpdateInternetLocations" to enable
@echo ----------------------------------------------------------------------------------
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d 1 /f
@echo . 
@echo .
@echo set registry "DisableWindowsUpdateAccess" to enable
@echo ----------------------------------------------------------------------------------
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d 1 /f
@echo .
@echo .
@echo set registry  "Windows Update Server connection information" to null
@echo ----------------------------------------------------------------------------------
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /t REG_SZ /d "" /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /t REG_SZ /d "" /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "UpdateServiceUrlAlternate" /t REG_SZ /d "" /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /t REG_DWORD /d 1 /f
@echo .
@echo .
@echo .

pause