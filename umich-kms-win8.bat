REM Copyright (c) 2015 Regents of the University of Michigan.
REM See LICENSE.txt for more information.
REM
REM See: http://www.itcs.umich.edu/itcsdocs/s4362/
REM See: https://technet.microsoft.com/en-us/library/ff793406.aspx
REM See: https://technet.microsoft.com/en-us/library/jj612867.aspx
%windir%\system32\cscript slmgr.vbs /ipk 32JNW-9KQ84-P47T8-D8GGY-CWCK7
%windir%\system32\cscript slmgr.vbs /skms mskms.umich.edu
%windir%\system32\cscript slmgr.vbs /ato
