@ehco off

Set current=%~dp0

echo .
echo .
echo .
echo .................................................................................................... 
echo "..... Disable Windows Defender ....
echo ....................................................................................................

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /f

pause