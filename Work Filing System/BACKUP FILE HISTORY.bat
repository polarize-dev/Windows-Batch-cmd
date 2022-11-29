@ECHO OFF

for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%

echo/
echo/
echo COPYRIGHT (C) %YYYY% - SCHEMA BIM - www.schemabim.com - ALL RIGHTS RESERVED.
echo FREE TO USE. DO NOT SELL/RESALE
echo/
echo DISCLAIMER: NO WARRANTY OR GUARANTY IMPLIES ON THE ACTION OR THE CONTENT OF THIS FILE. USE AT YOUR OWN RISK
echo/
echo/
echo/
echo/
echo/
echo/
echo  - right click and edit the file
echo  - replace the source with your source path i.e. C:\folder1..
echo  - replace the destination with your destination path i.e. C:\folder3..






: ################### EDIT FROM HERE ###################


: delete from here
pause
: delete till here



: SOURCE replace <source> with your source path
set soufrce=<source>
: DESTINATION replace <destination> with your destination path
set destination=<destination>




: ################### EDIT TILL HERE ###################












: ____ DO NOT CHANGE THE CODE BELOW ____


for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%

set stamp=BACKUP_%YYYY%%MM%%DD%



:choice1
set /P c=Do you want Full Backup [f] or How many days do you want to backup [?]?
if /I "%c%" EQU "f" goto :choice2
if /I "%c%" EQU "" goto :choice1
if /I "%c%" NEQ "f" goto :choice2
goto :choice1
exit


:choice2
set/P a=Do you want to shutdown afterwards [y]?
if /I "%a%" EQU "y" goto :Continue
goto :Continue
exit



:Continue
echo .
echo .
echo STARTED ...
if /I "%c%" EQU "f" goto :fullBackup
if /I "%c%" NEQ "f" goto :daybackup

:fullBackup
del "%soufrce%\*.00*.r*" /s /f /q
robocopy "%soufrce%" "%destination%\%stamp%-Full" *.* /S /R:2 /W:5
goto :Shutdown




:daybackup
del "%soufrce%\*.00*.r*" /s /f /q
robocopy "%soufrce%" "%destination%\%stamp%-%c%day" *.* /S /R:2 /W:5 /MAXAGE:%c%
goto :Shutdown






:Shutdown
if /I "%a%" EQU "y" goto :turn_OFF
exit


:turn_OFF
SHUTDOWN /p
exit














:  GUIDELINES

: /XO :: eXclude Older files.
: /MAXAGE:n :: MAXimum file AGE - exclude files older than n days/date.

: /S :: copy Subdirectories, but not empty ones.
: /E :: copy subdirectories, including Empty ones.
: /PURGE :: delete dest files/dirs that no longer exist in source.
: /XA:[RASHCNETO] :: eXclude files with any of the given Attributes set.

: /R:n :: number of Retries on failed copies: default 1 million.
: /W:n :: Wait time between retries: default is 30 seconds.

: /XA:[RASHCNETO] :: eXclude files with any of the given Attributes set. (H: Hidden)