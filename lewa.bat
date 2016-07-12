@echo off
color 0b
title Lewa OS

:next
cls
echo.
echo  Put your base rom into Base-Rom 
echo.
pause
echo.
echo  Put your port rom into Port-Rom
echo.
pause
echo.
echo  Extracting base rom
mkdir %cd%\Base-Rom\base
if exist "%cd%\Base-Rom\*.zip" (call %cd%\tools\7za.exe x "%cd%\Base-Rom\*" -o"%cd%\Base-Rom\base")
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
pause
echo.
echo  Extracting port rom
mkdir %cd%\Port-Rom\port
if exist "%cd%\Port-Rom\*.zip" (call %cd%\tools\7za.exe x "%cd%\Port-Rom\*" -o"%cd%\Port-Rom\port")
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
pause
goto next1

:next1
cls
echo.
echo Deleting unneseccessary files...
rd /s /q %cd%\Base-Rom\base\system\app
rd /s /q %cd%\Base-Rom\base\system\framework
rd /s /q %cd%\Base-Rom\base\system\media
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
pause
goto next2

:next2
cls
echo.
echo Copying necessary files...
echo Overwrite all
echo.
xcopy %cd%\Port-Rom\port\system\app %cd%\Base-Rom\base\system\app /e /i /h
xcopy %cd%\Port-Rom\port\system\framework %cd%\Base-Rom\base\system\framework /e /i /h
xcopy %cd%\Port-Rom\port\system\media %cd%\Base-Rom\base\system\media /e /i /h
xcopy %cd%\Base-Rom\base\system\bin %cd%\Port-Rom\port\system\bin
rmdir /s /q %cd%\Base-Rom\base\system\bin
mkdir %cd%\Base-Rom\base\system\bin
xcopy %cd%\Port-Rom\port\system\bin %cd%\Base-Rom\base\system\bin /e /i /h
xcopy %cd%\Base-Rom\base\system\etc %cd%\Port-Rom\port\system\etc
rmdir /s /q %cd%\Base-Rom\base\system\etc
mkdir %cd%\Base-Rom\base\system\etc
xcopy %cd%\Port-Rom\port\system\etc %cd%\Base-Rom\base\system\etc /e /i /h
rmdir %cd%\Base-Rom\base\system\etc\init.d
xcopy %cd%\Port-Rom\port\system\etc\init.d %cd%\Base-Rom\base\system\etc\init.d /e /i /h
xcopy %cd%\Base-Rom\base\system\etc\permissions %cd%\Port-Rom\port\system\etc\permissions
rmdir /s /q %cd%\Base-Rom\base\system\etc\permissions
mkdir %cd%\Base-Rom\base\system\etc\permissions
xcopy %cd%\Port-Rom\port\system\etc\permissions %cd%\Base-Rom\base\system\etc\permissions /e /h
xcopy %cd%\Base-Rom\base\system\lib %cd%\Port-Rom\port\system\lib
mkdir %cd%\Base-Rom\base\system\lib
xcopy %cd%\Port-Rom\port\system\lib %cd%\Base-Rom\base\system\lib /e /h
xcopy %cd%\Base-Rom\base\system\xbin %cd%\Port-Rom\port\system\xbin
rmdir /s /q %cd%\Base-Rom\base\system\xbin
mkdir %cd%\Base-Rom\base\system\xbin
xcopy %cd%\Port-Rom\port\system\xbin %cd%\Base-Rom\base\system\xbin /e /i /h
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
pause
goto next3

:next3
cls
echo.
echo  Opening build.prop ...
echo.
start notepad++ %cd%\Base-Rom\base\system\build.prop
echo.
echo  Add these lines below ro.cm.device=YOUR_DEVICE_NAME
echo  ro.lewa.version=YOUR_ROM_NAME
echo  ro.lewa.device=YOUR_DEVICE_NAME
echo.
pause
cls
echo.
echo  Add these lines in #ADDITIONAL_BUILD_PROPERTIES below ro.com.android.dataroaming=
echo  ro.compcache.default=0
echo  ro.lewa.swapper.part_path=/dev/block/mmcblk1p3
echo  ro.lewa.swapper.flash_swappiness=99
echo  ro.lewa.swapper.sd_swappiness=60
echo  ro.error.receiver.system.apps=com.lewa.fc
echo  ro.error.receiver.default=com.lewa.fc
echo  persist.sys.notif-speaker=1
echo  persist.sys.ring-speaker=1
echo  persist.sys.alarm-speaker=1
echo.
pause
cls
echo.
echo  Remove these lines
echo  persist.sys.themeId=Cyanbread
echo  persist.sys.themePackageName=com.tmobile.theme.Cya nbread
echo.
pause
cls
echo.
pause
goto tweaks

:tweaks
cls
start tweaks.bat
goto aroma

:aroma
cls
echo.
echo Has this rom Aroma Installer?
echo.
set /p arom=(y/n)
if %arom%==y (goto aromaa)
if %arom%==n (goto mod)

:aromaa
cls
del %cd%\Base-Rom\base\META-INF
xcopy %cd%\Port-Rom\port\META-INF %cd%\Base-Rom\base\META-INF
echo.
echo Than copy the folder from %cd%\Port-Rom\port except system and META-INF
echo.
pause
goto mod

:mod
cls
echo.
echo   Time to make all your modifications
echo   Press any key when you finish
echo.
pause
goto zip

:zip
cls
echo.
echo   Zipping Rom...
start %cd%\tools\7za a -mx9 -tzip "%cd%\rom_unsigned.zip" "%cd%\Base-Rom\base\*"
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
echo.
echo   --WHEN THE 7ZIP WINDOW CLOSES PRESS ANY KEY--
pause
goto sign

:sign
cls
cd "%~dp0"
echo.
echo   Signing Rom...
java -Xmx2048m -jar "%~dp0tools\signapk.jar" -w "%~dp0tools\testkey.x509.pem" "%~dp0tools\testkey.pk8" "%~dp0\rom_unsigned.zip" "%~dp0\rom_signed.zip"
echo.
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
echo   Rom signed!
echo.
pause
goto success

:success
cls
echo.
echo   ===========================================================================
echo                                 Porting Complete!                         
echo   ===========================================================================
echo.
pause
exit

:fail
cls
echo.
echo  ====================================================================
echo                            Porting failed
echo  ====================================================================
echo.
pause
exit