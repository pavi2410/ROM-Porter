@echo off
color 0a
title tweaks

:tweaks
cls
echo.
echo    Time to add some tweak!
echo.
echo    1.Skip tweaks                  9.Image quality
echo    2.Battery save                 10.Kernel error
echo    3.Camera                       11.Lock launcher
echo    4.Connect speed                12.Net speed
echo    5.Dalvik ram                   13.Performance tuning
echo    6.Deep sleep                   14.Proximity sensor
echo    7.Dial out                     15.Purge assets
echo    8.Flashled                     16.Quickpower
echo.
set /P r=Enter your decisions 
if %r%==1 (exit)
if %r%==2 (goto bs)
if %r%==3 (goto ca)
if %r%==4 (goto cs)
if %r%==5 (goto dr)
if %r%==6 (goto ds)
if %r%==7 (goto do)
if %r%==8 (goto fl)
if %r%==9 (goto iq)
if %r%==10 (goto ke)
if %r%==11 (goto ll)
if %r%==12 (goto ns)
if %r%==13 (goto pt)
if %r%==14 (goto ps)
if %r%==15 (goto pa)
if %r%==16 (goto qp)

:bs
cls
copy %cd%\tools\tweaks\battery_save.sh %cd%\Base-Rom\base\battery_save.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision 
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:ca
cls
copy %cd%\tools\tweaks\camera.sh %cd%\Base-Rom\base\camera.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:cs
cls
copy %cd%\tools\tweaks\connect_speed.sh %cd%\Base-Rom\base\connect_speed.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:dr
cls
copy %cd%\tools\tweaks\dalvik_ram.sh %cd%\Base-Rom\base\dalvik_ram.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:ds
cls
copy %cd%\tools\tweaks\deep_sleep.sh %cd%\Base-Rom\base\deep_sleep.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:do
cls
copy %cd%\tools\tweaks\dial_out.sh %cd%\Base-Rom\base\dial_out.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:fl
cls
copy %cd%\tools\tweaks\flashled.sh %cd%\Base-Rom\base\flashled.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:iq
cls
copy %cd%\tools\tweaks\jpg_quality.sh %cd%\Base-Rom\base\jpg_quality.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:ke
cls
copy %cd%\tools\tweaks\kernel_error.sh %cd%\Base-Rom\base\kernel_error.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:ll
cls
copy %cd%\tools\tweaks\lock_launcher.sh %cd%\Base-Rom\base\lock_launcher.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:ns
cls
copy %cd%\tools\tweaks\net_speed.sh %cd%\Base-Rom\base\net_speed.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:pt
cls
copy %cd%\tools\tweaks\perf_tuning.sh %cd%\Base-Rom\base\perf_tuning.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:ps
cls
copy %cd%\tools\tweaks\prox_sensor.sh %cd%\Base-Rom\base\prox_sensor.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:pa
cls
copy %cd%\tools\tweaks\purge_assets.sh %cd%\Base-Rom\base\purge_assets.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:qp
cls
copy %cd%\tools\tweaks\quickpower.sh %cd%\Base-Rom\base\quickpower.sh
if errorlevel 1 (
echo An error occured
PAUSE
goto fail2
)
echo.
echo   1.More tweaks
echo   2.No more tweaks
echo.
set /p rr=Enter your decision
if %rr%==1 (goto tweaks)
if %rr%==2 (exit)

:fail2
cls
echo.
echo   Tweak not found!
echo.
pause
goto tweaks