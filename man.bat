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
rd /s /q %cd%\Port-Rom\port\META-INF
rd /s /q %cd%\Port-Rom\port\system\vendor
rd /s /q %cd%\Port-Rom\port\system\lib\egl
rd /s /q %cd%\Port-Rom\port\system\lib\modules
rd /s /q %cd%\Port-Rom\port\system\lib\hw
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
xcopy %cd%\Base-Rom\base\META-INF %cd%\Port-Rom\port\META-INF /e /i /h
xcopy /-y %cd%\Base-Rom\base\system\addon.d %cd%\Port-Rom\port\system\addon.d
xcopy /-y %cd%\Base-Rom\base\system\bin %cd%\Port-Rom\port\system\bin
xcopy /-y %cd%\Base-Rom\base\system\etc %cd%\Port-Rom\port\system\etc
xcopy /-y %cd%\Base-Rom\base\system\customize %cd%\Port-Rom\port\system\customize
xcopy /-y %cd%\Base-Rom\base\system\framework %cd%\Port-Rom\port\system\framework
xcopy /-y %cd%\Base-Rom\base\system\lib %cd%\Port-Rom\port\system\lib
xcopy /-y %cd%\Base-Rom\base\system\vendor %cd%\Port-Rom\port\system\vendor
xcopy /-y %cd%\Base-Rom\base\system\xbin %cd%\Port-Rom\port\system\xbin
xcopy /y %cd%\Base-Rom\base\system\usr %cd%\Port-Rom\port\system\usr
xcopy /y %cd%\Base-Rom\base\system\bin\adb %cd%\Port-Rom\port\system\bin\adb
xcopy /y %cd%\Base-Rom\base\system\bin\brcm_patchram_plus %cd%\Port-Rom\port\system\bin\brcm_patchram_plus
xcopy /y %cd%\Base-Rom\base\system\bin\linker %cd%\Port-Rom\port\system\bin\linker
xcopy /y %cd%\Base-Rom\base\system\bin\logcat %cd%\Port-Rom\port\system\bin\logcat
xcopy /y %cd%\Base-Rom\base\system\bin\logwrapper %cd%\Port-Rom\port\system\bin\logwrapper
xcopy /y %cd%\Base-Rom\base\system\bin\rild %cd%\Port-Rom\port\system\bin\rild
xcopy /y %cd%\Base-Rom\base\system\bin\rmt_storage %cd%\Port-Rom\port\system\bin\rmt_storage
xcopy /y %cd%\Base-Rom\base\system\bin\vold %cd%\Port-Rom\port\system\bin\vold
xcopy /y %cd%\Base-Rom\base\system\bin\wpa_cli %cd%\Port-Rom\port\system\bin\wpa_cli
xcopy /y %cd%\Base-Rom\base\system\bin\wpa_supplicant %cd%\Port-Rom\port\system\bin\wpa_supplicant
xcopy /y %cd%\Base-Rom\base\system\etc\Bluetooth %cd%\Port-Rom\port\system\etc\Bluetooth
xcopy /y %cd%\Base-Rom\base\system\etc\Dhcpcd %cd%\Port-Rom\port\system\etc\Dhcpcd
xcopy /y %cd%\Base-Rom\base\system\etc\Firmware %cd%\Port-Rom\port\system\etc\Firmware
xcopy /y %cd%\Base-Rom\base\system\etc\gps %cd%\Port-Rom\port\system\etc\gps
xcopy /y %cd%\Base-Rom\base\system\etc\init.d %cd%\Port-Rom\port\system\etc\init.d
xcopy /y %cd%\Base-Rom\base\system\etc\permissions %cd%\Port-Rom\port\system\etc\permissions
xcopy /y %cd%\Base-Rom\base\system\etc\ppp %cd%\Port-Rom\port\system\etc\ppp
xcopy /y %cd%\Base-Rom\base\system\etc\security %cd%\Port-Rom\port\system\etc\security
xcopy /y %cd%\Base-Rom\base\system\etc\ssh %cd%\Port-Rom\port\system\etc\ssh
xcopy /y %cd%\Base-Rom\base\system\etc\terminfo %cd%\Port-Rom\port\system\etc\terminfo
xcopy /y %cd%\Base-Rom\base\system\etc\updatecmds %cd%\Port-Rom\port\system\etc\updatecmds
xcopy /y %cd%\Base-Rom\base\system\etc\wifi %cd%\Port-Rom\port\system\etc\wifi
xcopy /y %cd%\Base-Rom\base\system\etc\audio_effects.conf %cd%\Port-Rom\port\system\etc\audio_effects.conf
xcopy /y %cd%\Base-Rom\base\system\etc\audio_policy.conf %cd%\Port-Rom\port\system\etc\audio_policy.conf
xcopy /y %cd%\Base-Rom\base\system\etc\dbus.conf %cd%\Port-Rom\port\system\etc\dbus.conf
xcopy /y %cd%\Base-Rom\base\system\etc\gps.conf %cd%\Port-Rom\port\system\etc\gps.conf
xcopy /y %cd%\Base-Rom\base\system\etc\init.*.sh %cd%\Port-Rom\port\system\etc\init.*.sh
xcopy /y %cd%\Base-Rom\base\system\etc\media_codecs.xml %cd%\Port-Rom\port\system\etc\media_codecs.xml
xcopy /y %cd%\Base-Rom\base\system\etc\media_profiles.xml %cd%\Port-Rom\port\system\etc\media_profiles.xml
xcopy /y %cd%\Base-Rom\base\system\etc\nfcee_access.xml %cd%\Port-Rom\port\system\etc\nfcee_access.xml
xcopy /y %cd%\Base-Rom\base\system\etc\secomxregistry %cd%\Port-Rom\port\system\etc\secomxregistry
xcopy /y %cd%\Base-Rom\base\system\etc\vold.fstab %cd%\Port-Rom\port\system\etc\vold.fstab
xcopy /y %cd%\Base-Rom\base\system\lib\liblog.so %cd%\Port-Rom\port\system\lib\liblog.so
xcopy /y %cd%\Base-Rom\base\system\lib\libsecril-client %cd%\Port-Rom\port\system\lib\libsecril-client
xcopy /y %cd%\Base-Rom\base\system\lib\libreference-ril.so %cd%\Port-Rom\port\system\lib\libreference-ril.so
xcopy /y %cd%\Base-Rom\base\system\lib\libril.so %cd%\Port-Rom\port\system\lib\libril.so
xcopy /y %cd%\Base-Rom\base\system\lib\libs3cjpeg.so %cd%\Port-Rom\port\system\lib\libs3cjpeg.so
xcopy /y %cd%\Base-Rom\base\system\lib\libaudioflinger.so %cd%\Port-Rom\port\system\lib\libaudioflinger.so
xcopy /y %cd%\Base-Rom\base\system\lib\libaudioutils.so %cd%\Port-Rom\port\system\lib\libaudioutils.so
xcopy /y %cd%\Base-Rom\base\system\lib\libtinyalsa.so %cd%\Port-Rom\port\system\lib\libtinyalsa.so
if errorlevel 1 (
echo An error occured
PAUSE
goto fail
)
pause
goto choose

:choose
cls
echo.
echo Choose your device model (if it's not in these press skip)
echo 1.Skip
echo 2.HTC
echo 3.LGE
echo.
set /p ghh=
if %ghh%==1 (goto skip)
if %ghh%==2 (goto htc)
if %ghh%==3 (goto lge)

:htc
cls
xcopy /y %cd%\Base-Rom\base\system\lib\libhardware_legacy.so %cd%\Port-Rom\port\system\lib\libhardware_legacy.so
xcopy /y %cd%\Base-Rom\base\system\lib\libhtc_ril.so %cd%\Port-Rom\port\system\lib\libhtc_ril.so
xcopy /y %cd%\Base-Rom\base\system\lib\libhtc_ril_switch.so %cd%\Port-Rom\port\system\lib\libhtc_ril_switch.so
goto skip

:lge
cls
xcopy /y %cd%\Base-Rom\base\system\lib\lge-ril.so %cd%\Port-Rom\port\system\lib\lge-ril.so
goto skip

:skip
cls
echo.
%cd%\tools\7za.exe %cd%\Base-Rom\base\system\framework\framework-res.apk
%cd%\tools\7za.exe %cd%\Port-Rom\port\system\framework\framework-res.apk
echo In both files go to /res/xml/ and replace storage_list.xml of PORT framework-res.apk with the one of BASE.
echo Now close the apks
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
echo  Copy these lines from Base build.prop to Port build.prop:
echo.
echo ro.product.model=
echo ro.product.brand=
echo ro.product.name=
echo ro.product.device=
echo ro.product.board=
echo ro.product.cpu.abi=
echo ro.product.cpu.abi2=
echo.
pause
cls
echo  Copy these lines from Base build.prop to Port build.prop:
echo.
echo ro.product.manufacturer=
echo ro.wifi.channels=
echo ro.board.platform=
echo ro.build.product=
echo ro.build.characteristics=
echo rild.libpath=
echo rild.libargs=
echo wifi.interface=
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
goto zipa

:zipa

goto zip

:zip
cls
echo.
echo   Zipping Rom...
start %cd%\tools\7za a -mx9 -tzip "%cd%\rom_unsigned.zip" "%cd%\Port-Rom\port\*"
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