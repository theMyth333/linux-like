@title linux-on-windows installation window
:initialCheck
cls
@echo off
reg query "HKCU\Software\Microsoft\Command Processor" | findstr Autorun  > nul
if %errorlevel% == 1 goto new
if %errorlevel% == 0 goto existing
exit /B

:new 
cls
@echo off
echo **********************************************************
echo **********************************************************
echo ***                                                    ***
echo ***   linux-like version v0.1.0                        ***
echo ***                                                    ***
echo **********************************************************
echo **********************************************************
echo.
echo Choose any of the below option:
echo.
echo 1. install
echo 2. help
echo 3. exit
echo.

CHOICE /c:123  /n /m "-->"
if %errorlevel% == 1 goto install
if %errorlevel% == 2 goto help
if %errorlevel% == 3 goto exitScreen
exit /B

:existing
cls
@echo off
echo **********************************************************
echo **********************************************************
echo ***                                                    ***
echo ***   linux-like version v0.1.0                        ***
echo ***                                                    ***
echo **********************************************************
echo **********************************************************
echo.
echo Choose any of the below option:
echo.
echo 1. uninstall
echo 2. config
echo 3. help
echo 4. exit
echo.

CHOICE /c:1234  /n /m "-->"
if %errorlevel% == 1 goto uninstall
if %errorlevel% == 2 goto config
if %errorlevel% == 3 goto help
if %errorlevel% == 4 goto exitScreen

exit /B

:install
cls
echo linux-on-windows successfully installed.
echo press any key to continue...
mkdir %userprofile%\linux-on-windows
copy alias.doskey %userprofile%\linux-on-windows > nul
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"%userprofile%\linux-on-windows\alias.doskey\"" /f  > nul
reg query "HKCU\Software\Microsoft\Command Processor" /v Autorun  > nul
pause > nul
goto existing
exit /B


:uninstall
cls
reg delete "HKCU\Software\Microsoft\Command Processor" /v Autorun /f  > nul
rmdir /q /s %userprofile%\linux-on-windows > nul
echo linux-on-windows successfully uninstalled.
echo press any key to continue...
pause > nul
goto new
exit /B

:config
notepad %userprofile%\linux-on-windows\alias.doskey
pause > nul
exit /B

:help
start "" https://github.com/MithunKarthick/linux-like
goto initialCheck
exit /B

:exitScreen
exit /B
