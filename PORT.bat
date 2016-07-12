@echo off
color 0b
title ROM Porter by Pavitra :)
mkdir Base-Rom
mkdir Port-Rom
cls
echo.
echo   ****************************************************************************
echo   *                                                                          *
echo   *                             ROM Porter                                   *
echo   *                            by Pavitra :)                                 *
echo   *                                                                          *
echo   ****************************************************************************
echo.
pause
goto start

:start
cls
echo.
echo  =============================================================================
echo                      Welcome to Pavitra ROM Porter
echo.
echo    Things that you will need:
echo.
echo    1.A clean Cyanogenmod or AOSP that is running on your device as Base-Rom
echo    2.The ROM you want to port as Port-Rom
echo.
pause
cls
echo.
echo                                  Menu
echo.
echo    What rom are you porting?
echo.
echo    1.Stock or Cyanogenmod based
echo    2.MIUI
echo    3.Paranoid Android
echo    4.PAC MAN
echo    5.Manufacturer rom (Touchwiz, Sense)
echo    6.Lewa OS
echo. 
echo                    Troubleshoot
echo.
echo    7.Run fix tool
echo    8.Exit
echo  =============================================================================
set /p sdffs=Enter your choice:
if %sdffs%==1 (start sto.bat)
if %sdffs%==2 (start miui.bat)
if %sdffs%==3 (start pa.bat)
if %sdffs%==4 (start pac.bat)
if %sdffs%==5 (start man.bat)
if %sdffs%==6 (start lewa.bat)
if %sdffs%==7 (start fix.bat)
if %sdffs%==8 (exit)
