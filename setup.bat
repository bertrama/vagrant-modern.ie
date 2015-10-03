REM Inspired by https://gist.github.com/andreptb/57e388df5e881937e62a

@echo off
set WINRM_EXEC=call %SYSTEMROOT%\System32\winrm
%WINRM_EXEC% quickconfig -q
%WINRM_EXEC% set winrm/config/winrs @{MaxMemoryPerShellMB="300"}
%WINRM_EXEC% set winrm/config @{MaxTimeoutms="1800000"}
%WINRM_EXEC% set winrm/config/client/auth @{Basic="true"}
%WINRM_EXEC% set winrm/config/service @{AllowUnencrypted="true"}
%WINRM_EXEC% set winrm/config/service/auth @{Basic="true"}

REM TODO: Do conditionals on the ver command to replace the different version .bat scripts
REM Idea: http://malektips.com/xp_dos_0025.html#.VhAbQJcSU8o
REM
REM ver | find "VERSION_STRING" > nul
REM if %ERRORLEVEL% == 0 goto ver_x
REM
REM :ver_x
REM ...
REM goto register_vista | register_later
REM
REM :register_vista
REM ...
REM goto done
REM :register_later
REM ...
REM goto done
REM :done
