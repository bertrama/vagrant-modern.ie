REM Copyright (c) 2015 Regents of the University of Michigan.
REM See LICENSE.txt for more information.
REM
REM Windows Vista and Server 2008 up to R1
REM See: http://www.itcs.umich.edu/itcsdocs/s4362/

%windir%\system32\cscript slmgr.vbs -skms mskms.umich.edu
%windir%\system32\cscript slmgr.vbs -ato
