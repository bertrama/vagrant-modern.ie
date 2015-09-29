REM Copyright (c) 2015 Regents of the University of Michigan.
REM See LICENSE.txt for more information.
REM
REM Windows 7 and Server 2008 R2 and later
REM See: http://www.itcs.umich.edu/itcsdocs/s4362/

%windir%\system32\cscript slmgr.vbs /skms mskms.umich.edu
%windir%\system32\cscript slmgr.vbs /ato
