@echo off

del 1.txt
del count.txt
del result.txt

echo 1>count.txt

:Main
devcon find *VID_046D* *VID_0510*>1.txt
comp 1.txt normal.txt <n.txt

if "%ERRORLEVEL%"== "0" goto detect
goto No

:detect
for /f "delims=" %%i in (count.txt) do SET /a p=%%i+1
echo %p% >count.txt
echo %p% : %date% %time% detect the all of HID Device

echo ------------------------------------------------------------ >>result.txt
echo %p% : %date% %time% detect the all of HID Device >>result.txt
echo ------------------------------------------------------------ >>result.txt 
devcon find *VID_046D* *VID_0510* >>result.txt
choice /t 111 /d n > nul
goto Main


:No
for /f "delims=" %%i in (count.txt) do SET /a p=%%i+1
echo %p% >count.txt
echo %p% : %date% %time% =====  FAIL HID Device =====

echo 
echo ****************************************** >>result.txt
echo %p% : %date% %time% =====  FAIL HID Device ===== >>result.txt
echo ****************************************** >>result.txt
devcon find *VID_046D* *VID_0510* >>result.txt
shutdown -s -f -t 20