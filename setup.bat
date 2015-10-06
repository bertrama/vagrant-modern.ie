REM Copyright (c) 2015 Regents of the University of Michigan.
REM See LICENSE.txt for more information.
@echo off

REM Inspired by https://gist.github.com/andreptb/57e388df5e881937e62a
REM See: http://www.itcs.umich.edu/itcsdocs/s4362/
REM See: https://technet.microsoft.com/en-us/library/ff793406.aspx
REM See: https://technet.microsoft.com/en-us/library/jj612867.aspx
REM See: http://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
REM See: https://en.wikipedia.org/wiki/List_of_Microsoft_Windows_versions


:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

set WINRM_EXEC=call %SYSTEMROOT%\System32\winrm
%WINRM_EXEC% quickconfig -q
%WINRM_EXEC% set winrm/config/winrs @{MaxMemoryPerShellMB="300"}
%WINRM_EXEC% set winrm/config @{MaxTimeoutms="1800000"}
%WINRM_EXEC% set winrm/config/client/auth @{Basic="true"}
%WINRM_EXEC% set winrm/config/service @{AllowUnencrypted="true"}
%WINRM_EXEC% set winrm/config/service/auth @{Basic="true"}

ver | find "Version 6.0" > nul
if %ERRORLEVEL% == 0 goto vista

ver | find "Version 6.1" > nul
if %ERRORLEVEL% == 0 goto win7

ver | find "Version 6.2" > nul
if %ERRORLEVEL% == 0 goto win8

ver | find "Version 6.3" > nul
if %ERRORLEVEL% == 0 goto win81

ver | find "Version 10.0" > nul
if %ERRORLEVEL% == 0 goto win10
goto done

:vista
%windir%\system32\cscript slmgr.vbs /ipk VKK3X-68KWM-X2YGT-QR4M6-4BWMV
goto activate_vista

:win7
%windir%\system32\cscript slmgr.vbs /ipk 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
goto activate

:win8
%windir%\system32\cscript slmgr.vbs /ipk 32JNW-9KQ84-P47T8-D8GGY-CWCK7
goto activate

:win81
%windir%\system32\cscript slmgr.vbs /ipk MHF9N-XY6XB-WVXMC-BTDCT-MKKG7
goto activate

:win10
%windir%\system32\cscript slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
goto activate

REM Activate Windows Vista and older
:activate_vista
%windir%\system32\cscript slmgr.vbs -skms mskms.umich.edu
%windir%\system32\cscript slmgr.vbs -ato
goto done

REM Activate Windows 7 and newer.
:activate
%windir%\system32\cscript slmgr.vbs /skms mskms.umich.edu
%windir%\system32\cscript slmgr.vbs /ato
goto done

:done
echo "Update complete!"
