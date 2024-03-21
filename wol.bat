@echo off
set /a a=0
:_loop
set /a a+=1


ECHO ===================================================
echo %a%
wolcmd 00190F30A069 39.115.205.206 255.255.255.0 7
timeout /t 90

if %a%==10000 gogo _break

goto _loop

:_break
pause


