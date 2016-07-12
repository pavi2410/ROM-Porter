@echo off
echo.
echo  ****************************************
echo  *                                      *
echo  *         Rom Porter Fix Tool          *
echo  *                                      *
echo  ****************************************
echo.
mkdir fix
pause
goto start

:start
cls
echo.
echo   What fix are you searching for?
echo.
echo   1.Bootloop fix
echo   2.Htc network auto select
echo   3.Htc graphical issues
echo   4.Exit
echo.
set /p menu=Enter your decision 
if %menu%==1 (goto bl)
if %menu%==2 (goto htcn)
if %menu%==3 (goto s)
if %menu%==4 (goto exit)

:bl
cls
xcopy %cd%\Port-Rom\port\system\lib\libandroid_runtime.so %cd%\Base-Rom\base\system\lib\libandroid_runtime.so
xcopy %cd%\Port-Rom\port\system\lib\libandroid_servers.so %cd%\Base-Rom\base\system\lib\libandroid_servers.so
xcopy %cd%\Port-Rom\port\system\lib\libmedia_jni.so %cd%\Base-Rom\base\system\lib\libmedia_jni.so
pause
goto start

:htcn
cls
call apktool d -f %cd%\Base-Rom\base\system\framework\framework-res.apk %cd%\fix\framework-res
start notepad++ %cd%\fix\framework-res\res\values\bools.xml
cls
echo.
echo  Change this line in bools.xml
echo.
echo  from   bool name="skip_restoring_network_selection" true /bool
echo  to     bool name="skip_restoring_network_selection" false /bool
echo.
echo  Then close the file
echo.
pause
call apktool b -f %cd%\fix\framework-res %cd%\Base-Rom\base\system\framework\framework-res.apk
goto start

:htcg
cls
cd tools
java -jar baksmali.jar -x "../Base-Rom/base/system/framework/framework.jar" -o "../fix/framework-base"
java -jar baksmali.jar -x "../Port-Rom/port/system/framework/framework.jar" -o "../fix/framework-port"
rd /s /q "../fix/framework-base/android/os"
rd /s /q "../fix/framework-base/android/view"
rd /s /q "../fix/framework-base/Environment"
rd /s /q "../fix/framework-base/SystemProperties"
rd /s /q "../fix/framework-base/HardwareCanvas"
rd /s /q "../fix/framework-base/HardwareRenderer$Gl20Renderer"
rd /s /q "../fix/framework-base/HardwareRenderer$GlRenderer"
rd /s /q "../fix/framework-base/HardwareRenderer"
xcopy "../fix/framework-port/android/os" "../fix/framework-base/android/os" /e /i /h
xcopy "../fix/framework-port/android/view" "../fix/framework-base/android/view" /e /i /h
xcopy "../fix/framework-port/Environment" "../fix/framework-base/Environment" /e /i /h
xcopy "../fix/framework-port/SystemProperties" "../fix/framework-base/SystemProperties" /e /i /h
xcopy "../fix/framework-port/HardwareCanvas" "../fix/framework-base/HardwareCanvas" /e /i /h
xcopy "../fix/framework-port/HardwareRenderer$Gl20Renderer" "../fix/framework-base/HardwareRenderer$Gl20Renderer" /e /i /h
xcopy "../fix/framework-port/HardwareRenderer$GlRenderer" "../fix/framework-base/HardwareRenderer$GlRenderer" /e /i /h
xcopy "../fix/framework-port/HardwareRenderer" "../fix/framework-base/HardwareRenderer" /e /i /h
cd ..
cd fix
mkdir classes-base
cd ..
cd tools
java -Xmx512M -jar smali.jar "../fix/framework-base" -o "../fix/classes-base/classes.dex"
call 7za.exe d "../Base-Rom/base/system/framework/framework.jar" classes.dex -r
call 7za.exe a -tjar "../Base-Rom/base/system/framework/framework.jar" "../fix/classes-base/classes.dex"
cd ..
pause
goto start

:exit
exit
