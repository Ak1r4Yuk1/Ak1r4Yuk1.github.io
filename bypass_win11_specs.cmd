@echo off
rem ================================================================================
rem  Windows 11 Requirements Bypass
rem ================================================================================
rem
rem  Written by Shiro39
rem  Last modified 2021-08-03
rem
rem ================================================================================
title Windows 11
mode con:cols=80 lines=20

REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto firstpage
) else ( 
	goto gotAdmin
)

:firstpage
cls
echo Where are you running this script on?
echo.
echo  1. On the currently running Windows
echo  2. On the installation
echo.
echo.
echo Do NOT choose option 1 if you are on the installation!
echo It will cause an infinite loop!
echo.
set /p input=Input: 
if /i "%input%" == "1" (
	set "input="
	goto BatchGotAdmin
) 
if /i "%input%" == "2" (
	set "input="
	goto main
) else (
	set "input="
	goto firstpage
)

:BatchGotAdmin
REM https://sites.google.com/site/eneerge/scripts/batchgotadmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
	cls
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:main
cls
echo ================================================================================
echo  Windows 11 Requirements Bypass
echo ================================================================================
echo.

echo Adding key "BypassCPUCheck" into registry...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /f /t REG_DWORD /d 1 > nul
echo Adding key "BypassStorageCheck" into registry...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /f /t REG_DWORD /d 1 > nul
echo Adding key "BypassRAMCheck" into registry...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /f /t REG_DWORD /d 1 > nul
echo Adding key "BypassTPMCheck" into registry...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /f /t REG_DWORD /d 1 > nul
echo Adding key "BypassSecureBootCheck" into registry...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /f /t REG_DWORD /d 1 > nul
echo Adding additional key "AllowUpgradesWithUnsupportedTPMOrCPU" into registry...
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /f /t REG_DWORD /d 1 > nul

echo.
echo All the needed registries to bypass the requirements has been added.
echo Now go back to previous page and then go to the next page to proceed.
echo You should no longer see the "Unsupported" message anymore.
echo.
echo ================================================================================

echo.
echo Press any key to close this CMD...
pause > nul
exit
