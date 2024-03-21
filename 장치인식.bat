@echo off
ping 127.0.0.1 
del 1.txt
cd\
devcon find *dev_1100* >1.txt
comp 1.txt right.txt <n.txt

if "%ERRORLEVEL%" == "0" goto detect
goto No

:detect
echo ## >>resault.txt
echo %date% %time%  detect the all of card>>resault.txt
echo ## >>resault.txt
devcon find *dev_1100* >>resault.txt
shutdown -s -f -t 30 
goto Exit


:No
echo ********************************************************** >> resault.txt
echo %date% %time%  Can't detect the all of card >> resault.txt
echo ********************************************************** >> resault.txt
devcon find *dev_1100* >>resault.txt
goto Exit


:Exit



