@title linux-on-windows installation window
:initialCheck
@echo off
reg query "HKCU\Software\Microsoft\Command Processor" | findstr Autorun  > nul
if %errorlevel% == 1 goto new
if %errorlevel% == 0 goto existing
exit /B

:new 
@echo off
echo Choose any of the below option:
echo 1. install
echo 2. config
echo 3. help
echo.

CHOICE /c:123  /n /m "-->"
if %errorlevel% == 1 goto install
if %errorlevel% == 2 goto config
if %errorlevel% == 3 goto help
exit /B

:existing
@echo off
echo Choose any of the below option:
echo 1. uninstall
echo 2. config
echo 3. help
echo.

CHOICE /c:123  /n /m "-->"
if %errorlevel% == 1 goto uninstall
if %errorlevel% == 2 goto config
if %errorlevel% == 3 goto help

exit /B

:install
echo linux-on-windows successfully installed.
echo press any key to exit
mkdir %userprofile%\linux-on-windows
copy alias.doskey %userprofile%\linux-on-windows > nul
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"%userprofile%\linux-on-windows\alias.doskey\"" /f  2>nul
reg query "HKCU\Software\Microsoft\Command Processor" /v Autorun 2>nul
pause > nul
exit /B


:uninstall
cls
reg delete "HKCU\Software\Microsoft\Command Processor" /v Autorun /f  > nul
rmdir /q /s %userprofile%\linux-on-windows
echo linux-on-windows successfully uninstalled.
pause > nul
exit /B

:config
notepad %userprofile%\linux-on-windows\alias.doskey
pause > nul
exit /B

:help
pause > nul
exit /B
