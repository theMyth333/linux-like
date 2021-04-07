:::::::::::::::::::::::::::::::::::::::::
:: linux-like v0.1.0
:: Created by Mithun under GNU Licence
:::::::::::::::::::::::::::::::::::::::::


@title linux-like 

:: check for already installed version
:initialization
cls
@echo off
:: check for existing doskey registry
reg query "HKCU\Software\Microsoft\Command Processor" | findstr Autorun  > nul
if %errorlevel% == 1 goto new
if %errorlevel% == 0 goto existing
exit /B

:: if linux-like is not yet installed
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
echo Choose any of the below options:
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

:: if linux-like is already installed
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
echo Choose any of the below options:
echo.
echo 1. uninstall
echo 2. open doskey file
echo 3. help
echo 4. exit
echo.

CHOICE /c:1234  /n /m "-->"
if %errorlevel% == 1 goto uninstall
if %errorlevel% == 2 goto config
if %errorlevel% == 3 goto help
if %errorlevel% == 4 goto exitScreen
exit /B

:: installing linux-like
:install
cls
mkdir %userprofile%\linux-like
:: setting up doskey registry
copy alias.doskey %userprofile%\linux-like > nul 
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"%userprofile%\linux-like\alias.doskey\"" /f  > nul 
:: reg query "HKCU\Software\Microsoft\Command Processor" /v Autorun  > nul
echo linux-like successfully installed.
echo press any key to continue... 
pause > nul
goto existing
exit /B

:: uninstall linux-like
:uninstall
cls
reg delete "HKCU\Software\Microsoft\Command Processor" /v Autorun /f  > nul
rmdir /q /s %userprofile%\linux-like > nul
echo linux-like successfully uninstalled.
echo press any key to continue...
pause > nul
goto new
exit /B

:: doskey file
:config
notepad %userprofile%\linux-like\alias.doskey
pause > nul
goto initialization
exit /B

:: open github link for linux-like
:help
start "" https://github.com/MithunKarthick/linux-like
goto initialization
exit /B

:: exit
:exitScreen
exit /B
