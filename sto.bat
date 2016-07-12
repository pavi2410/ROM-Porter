@echo off
color 0b
title Stock or Cyanogenmod based Rom

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
rd /s /q %cd%\Base-Rom\base\system\fonts
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
echo.
xcopy %cd%\Port-Rom\port\system\app %cd%\Base-Rom\base\system\app /e /i /h
xcopy %cd%\Port-Rom\port\system\fonts %cd%\Base-Rom\base\system\fonts /e /i /h
xcopy %cd%\Port-Rom\port\system\framework %cd%\Base-Rom\base\system\framework /e /i /h
xcopy %cd%\Port-Rom\port\system\media %cd%\Base-Rom\base\system\media /e /i /h
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
echo  Go to Base-Rom\base\system\etc\permissions and copy all the files 
echo  except platform and handheld_hardware (or handheld_core_hardware) 
echo  present in Port-Rom\port\system\etc\permissions
pause
echo.
echo  Go to Base-Rom\base\system\etc\init.d and delete everything except banner
echo  and then copy all the files present inside init.d of Port-Rom\port\system\etc\permissions 
echo  to Base-Rom\base\system\etc\init.d
echo.
pause
goto next5

:next5
cls
echo.
echo  Opening build.prop ...
echo.
start notepad++ %cd%\Base-Rom\base\system\build.prop
echo.
echo  Write what you want in these lines:
echo  ro.build.id=
echo  ro.build.display.id=
echo  ro.build.date=
echo  ro.modversion=
echo.
pause
cls
start notepad++ %cd%\Port-Rom\port\system\build.prop
echo.
echo  Copy these lines from Port build.prop to Base build.prop :
echo.
echo  ro.config.ringtone=
echo  ro.config.notification_sound=
echo  ro.config.alarm_alert=
echo.
echo  Close the build.prop files
echo.
pause
cls
echo.
echo  Overwrite the set_perm from Port updater-script to base updater-script
start notepad++ %cd%\Port-Rom\port\META-INF\com\google\android\updater-script
start notepad++ %cd%\Base-Rom\base\META-INF\com\google\android\updater-script
echo.
echo  Then close the updater-script
echo.
pause
cls
echo.
echo   Copy every extra folder or file from \Port-Rom\port\system to
echo   \Base-Rom\base\system
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