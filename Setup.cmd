@echo off

:: -------------------------------------------------------------------------------------------------------
:: ----  USB디스크를 찾아 %USB% 변수 지정
:: -------------------------------------------------------------------------------------------------------
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (if exist %%i:\ISO set USB=%%i:)
cls

:: -------------------------------------------------------------------------------------------------------
:: ----  폴더 경로 변수 지정
:: -------------------------------------------------------------------------------------------------------
cd /d "%USB%"
set Setup=X:\Sources\setup.exe
set Auto=%USB%\Windows Setting\Autounattend

:: -------------------------------------------------------------------------------------------------------
:: ----  OS설치 디스크의 존재 여부를 확인
:: -------------------------------------------------------------------------------------------------------
diskpart /s "%Auto%\list_disk.txt" > "%Auto%\check_disk.txt"
"%Auto%\comp.exe" "%Auto%\no_disk.txt" "%Auto%\check_disk.txt" < "%Auto%\n.txt"
if "%ERRORLEVEL%" == "0" goto NO_DISK
goto OK_DISK

:: -------------------------------------------------------------------------------------------------------
:: ----  OS를 설치할 디스크를 선택
:: -------------------------------------------------------------------------------------------------------
:OK_DISK
cls
echo .
echo .
echo  ---------------------------------------------------------------
echo .
echo  --------     Select the disk to install the Windows    --------
echo .
echo  ---------------------------------------------------------------
diskpart /s "%Auto%\list_disk.txt"
echo .
echo .
echo  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo .
echo .  !!!     Caution: Whole data is lost after selecting the disk     !!!
echo .
echo  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo .
echo .
set /p Disk=. Select disk (ex. If you want to choose "Disk 0", press "0"):   
if "%Disk%"=="0" goto Sel_Disk0
if "%Disk%"=="1" goto Sel_Disk1
goto Init

:: -------------------------------------------------------------------------------------------------------
:: ----  디스크0을 선택하였을때 설치 언어 선택 (필수 아님)
:: ----  setdup을 진행할 때 표시 언어에 따르지만 Default 영어로 대체할 수 있음
:: -------------------------------------------------------------------------------------------------------
:Sel_Disk0
cls
echo .
echo .
echo .
echo  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo .
echo  - - -     All data in DISK0 will be deleted.     - - -
echo .
echo  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo .
echo .
echo  ---------------------------------------------------------------
echo  --------     Select the Language ( KOREAN or English)    --------
echo  ---------------------------------------------------------------
echo .
echo .     1.   Korean
echo .
echo .     2.   English
echo .
echo .

set /p Choose= ...  Plese selecte the number and press Enter :
if "%Choose%"=="1" goto Install0_Kor
if "%Choose%"=="2" goto Install0_Eng
goto OK_DISK

:: -------------------------------------------------------------------------------------------------------
:: ----  디스크0 에서의 Windows 버전 선택 (라이선스키 항목이 다름)
:: -------------------------------------------------------------------------------------------------------
:Install0_Kor
cls
echo .
echo  ------------------------------------------------------------------
echo .
echo  -----   Windows Auto Installation for Advantech   ------  
echo .
echo  ------------------------------------------------------------------
echo .
echo .
echo          1.  Auto Installation ( LTSC 2019 )
echo .
echo          2.  Auto Installation ( SAC - IoT Enterprise )
echo .
echo          3.  Auto Installation ( LTSB 2016 )
echo .
echo          4.  Auto Installation ( CBB - Enterprise )
echo .
echo          5.  Auto Installation ( LTSC 2021 )
echo .
echo          6. Exit
echo .
echo .
echo  ---------------------------------------------------------------
echo .
set /p menu=Select and enter :   
if "%menu%"=="1" goto _LTSC2019_Kor
if "%menu%"=="2" goto _SAC_Kor
if "%menu%"=="3" goto _LTSB_Kor
if "%menu%"=="4" goto _CBB_Kor
if "%menu%"=="5" goto _LTSC2021_Kor
if "%menu%"=="6" goto Exit
goto Install0_Kor

:: -------------------------------------------------------------------------------------------------------
:: ----  디스크0 에서의 Windows 버전 선택 (라이선스키 항목이 다름) - 영어
:: -------------------------------------------------------------------------------------------------------
:Install0_Eng
cls
echo .
echo  ------------------------------------------------------------------
echo .
echo  -----   Windows Auto Installation for Advantech   ------  
echo .
echo  ------------------------------------------------------------------
echo .
echo .
echo          1.  Auto Installation ( LTSC 2019 )
echo .
echo          2.  Auto Installation ( SAC - IoT Enterprise )
echo .
echo          3.  Auto Installation ( LTSB 2016 )
echo .
echo          4.  Auto Installation ( CBB - Enterprise )
echo .
echo          5.  Auto Installation ( LTSC 2021 )
echo .
echo          6. Exit
echo .
echo .
echo  ---------------------------------------------------------------
echo .
set /p menu=Select and enter :   
if "%menu%"=="1" goto _LTSC2019_Eng
if "%menu%"=="2" goto _SAC_Eng
if "%menu%"=="3" goto _LTSB_Eng
if "%menu%"=="4" goto _CBB_Eng
if "%menu%"=="5" goto _LTSC2021_Eng
if "%menu%"=="6" goto Exit
goto Install0_Eng

:: -------------------------------------------------------------------------------------------------------
:: ----  디스크1을 선택하였을때 설치 언어 선택 (필수 아님)
:: ----  setdup을 진행할 때 표시 언어에 따르지만 Default 영어로 대체할 수 있음
:: -------------------------------------------------------------------------------------------------------
:Sel_Disk1
cls
echo .
echo .
echo .
echo  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo .
echo  - - -     All data in "DISK1" will be deleted.     - - -
echo .
echo  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo .
echo .
echo  ---------------------------------------------------------------
echo  --------     Select the Language ( KOREAN or English)    --------
echo  ---------------------------------------------------------------
echo .
echo .     1.   Korean
echo .
echo .     2.   English
echo .
echo .
set /p Choose= ... Do you want install on Disk 1 (Y/N) :
if "%Choose%"=="1" goto Install1_Kor
if "%Choose%"=="2" goto Install1_Eng
goto OK_DISK


:: -------------------------------------------------------------------------------------------------------
:: ----  디스크1 에서의 Windows 버전 선택 (라이선스키 항목이 다름) - 한국어
:: -------------------------------------------------------------------------------------------------------
:Install1_Kor
cls
echo .
echo  ------------------------------------------------------------------
echo .
echo  -----   Windows Auto Installation for Advantech   ------  
echo .
echo  ------------------------------------------------------------------
echo .
echo .
echo          1.  Auto Installation ( LTSC 2019 )
echo .
echo          2.  Auto Installation ( SAC - IoT Enterprise )
echo .
echo          3.  Auto Installation ( LTSB 2016 )
echo .
echo          4.  Auto Installation ( CBB - Enterprise)
echo .
echo          5.  Auto Installation ( LTSC 2021 )
echo .
echo          6. Exit
echo .
echo .
echo  ---------------------------------------------------------------
echo .
set /p menu=Select and enter :   
if "%menu%"=="1" goto _LTSC2019_Kor_DISK1
if "%menu%"=="2" goto _SAC_Kor_DISK1
if "%menu%"=="3" goto _LTSB_Kor_DISK1
if "%menu%"=="4" goto _CBB_Kor_DISK1
if "%menu%"=="5" goto _LTSC2021_Kor_DISK1
if "%menu%"=="6" goto Exit
goto Install1_Kor

:: -------------------------------------------------------------------------------------------------------
:: ----  디스크1 에서의 Windows 버전 선택 (라이선스키 항목이 다름) - 영어
:: -------------------------------------------------------------------------------------------------------
:Install1_Eng
cls
echo .
echo  ------------------------------------------------------------------
echo .
echo  -----   Windows Auto Installation for Advantech   ------  
echo .
echo  ------------------------------------------------------------------
echo .
echo .
echo          1.  Auto Installation ( LTSC 2019 )
echo .
echo          2.  Auto Installation ( SAC - IoT Enterprise )
echo .
echo          3.  Auto Installation ( LTSB 2016 )
echo .
echo          4.  Auto Installation ( CBB - Enterprise )
echo .
echo          5.  Auto Installation ( LTSC 2021 )
echo .
echo          6. Exit
echo .
echo .
echo  ---------------------------------------------------------------
echo .
set /p menu=Select and enter :   
if "%menu%"=="1" goto _LTSC2019_Eng_DISK1
if "%menu%"=="2" goto _SAC_Eng_DISK1
if "%menu%"=="3" goto _LTSB_Eng_DISK1
if "%menu%"=="4" goto _CBB_Eng_DISK1
if "%menu%"=="5" goto _LTSC2021_Eng_DISK1
if "%menu%"=="6" goto Exit
goto Install1_Eng


:: -------------------------------------------------------------------------------------------------------
:: ----  Autounattend.xml 파일 지정
:: -------------------------------------------------------------------------------------------------------

:_LTSC2019_Kor
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_LTSC2019.xml"
goto Exit

:_SAC_Kor
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_SAC.xml"
goto Exit

:_LTSB_Kor
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_LTSB.xml"
goto Exit

:_CBB_Kor
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_CBB.xml"
goto Exit

:_LTSC2021_Kor
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_LTSC2021.xml"
goto Exit

:_LTSC2019_Eng
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_LTSC2019.xml"
goto Exit

:_SAC_Eng
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_SAC.xml"
goto Exit

:_LTSB_Eng
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_LTSB.xml"
goto Exit

:_CBB_Eng
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_CBB.xml"
goto Exit

:_LTSC2021_Eng
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_LTSC2021.xml"
goto Exit


:_LTSC2019_Kor_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_DISK1_LTSC2019.xml"
goto Exit

:_SAC_Kor_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_DISK1_SAC.xml"
goto Exit

:_LTSB_Kor_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_DISK1_LTSB.xml"
goto Exit

:_CBB_Kor_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_DISK1_CBB.xml"
goto Exit

:_LTSC2021_Kor_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_DISK1_LTSC2021.xml"
goto Exit

:_LTSC2019_Eng_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_DISK1_LTSC2019.xml"
goto Exit

:_SAC_Eng_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_DISK1_SAC.xml"
goto Exit

:_LTSB_Eng_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_DISK1_LTSB.xml"
goto Exit

:_CBB_Eng_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_DISK1_CBB.xml"
goto Exit

:_LTSC2021_Eng_DISK1
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
"%Setup%" /unattend:"%Auto%\Autounattend_Eng_DISK1_LTSC2021.xml"
goto Exit

:: -------------------------------------------------------------------------------------------------------
:: ----  초기 OS 설치 디스크가 없을 경우 아래와 같은 메시지 출력
:: -------------------------------------------------------------------------------------------------------
:No_DISK
cls
echo .
echo .
echo  ---------------------------------------------------------------
echo .
echo  ---------   There is no disk to install the Windows   ---------
echo .
echo  ---------   Please Insert the disk for installation     -------
echo .
echo  ---------------------------------------------------------------
echo .
echo .
echo .
echo .
echo ....   System will be shutdown after pressing any keys   ...
echo .
pause
goto Exit


:Exit
exit

