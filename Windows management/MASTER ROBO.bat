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
: ____ DO NOT CHANGE THE CODE BELOW ____


: Date str generator
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%

set stamp=BACKUP_%YYYY%%MM%%DD%





: Choose a directory
:sourceP
    set /P source=What is the [SOURCE] path?
        if /I "%source%" EQU "" goto :sourceP
:destinationP
    set /P destination=What is the [DESTINATION] path?
        if /I "%destination%" EQU "" goto :destinationP


: Choose what you want to do
:masterchoice
    set /P operation=What do you want to do? [mirror, copy, move, FH, delete]
    if /I "%operation%" EQU "mirror" goto :copychoice
    if /I "%operation%" EQU "copy" goto :copychoice
    if /I "%operation%" EQU "move" goto :shutdownchoice
    if /I "%operation%" EQU "FH" goto :FH0
    if /I "%operation%" EQU "delete" goto :delete
    goto :masterchoice
    exit



:FH0
set /P c=Do you want Full Backup [f] or How many days do you want to backup [?]?
if /I "%c%" EQU "f" goto :shutdownchoice
if /I "%c%" EQU "" goto :FH0
if /I "%c%" NEQ "f" goto :shutdownchoice
goto :FH0
exit






: Choose to copy empty directories
:copychoice
    set /P copyopration=Do you want to include empty directories? [y,n]
    if /I "%copyopration%" EQU "y" goto :shutdownchoice
    if /I "%copyopration%" EQU "n" goto :shutdownchoice
    goto :copychoice
    exit



: Choose to shutdown
:shutdownchoice
    set/P a=Do you want to shutdown afterwards [y]?
    if /I "%a%" EQU "y" goto :continue
    goto :continue
    exit



: Choose what you want to do stage II
:continue
    if /I "%operation%" EQU "mirror" goto :mirror0
    if /I "%operation%" EQU "copy" goto :copy0
    if /I "%operation%" EQU "move" goto :move1
    if /I "%operation%" EQU "fh" goto :fh1
    if /I "%operation%" EQU "delete" goto :delete





: Choose to copy empty directories stage II
:mirror0
    if /I "%copyopration%" EQU "y" goto :mirror1
    if /I "%copyopration%" EQU "n" goto :mirror2
    goto :copychoice
    exit


:copy0
    if /I "%copyopration%" EQU "y" goto :copy1
    if /I "%copyopration%" EQU "n" goto :copy2
    goto :copychoice
    exit



: STAGE III
:mirror1
robocopy "%source%" "%destination%" *.* /MIR /E /XA:H /R:2 W:5
goto :Shutdown

:mirror2
robocopy "%source%" "%destination%" *.* /MIR /S /XA:H /R:2 W:5
goto :Shutdown


:copy1
robocopy "%source%" "%destination%" *.* /E /XA:H /R:2 W:5
goto :Shutdown


:copy2
robocopy "%source%" "%destination%" *.* /S /XA:H /R:2 W:5
goto :Shutdown



:move1
robocopy "%source%" "%destination%" *.* /MOVE /E /R:2 W:5
goto :Shutdown


:fh1
if /I "%c%" EQU "f" goto :fullBackup
if /I "%c%" NEQ "f" goto :daybackup

:fullBackup
del "%source%\*.00*.r*" /s /f /q
robocopy "%source%" "%destination%\%stamp%-Full" *.* /S /R:2 /W:5
goto :Shutdown

:daybackup
del "%source%\*.00*.r*" /s /f /q
robocopy "%source%" "%destination%\%stamp%-%c%day" *.* /S /R:2 /W:5 /MAXAGE:%c%
goto :Shutdown




:delete
rd "%source%" /S /Q
exit


: STAGE IV
:Shutdown
if /I "%a%" EQU "y" goto :turn_OFF


:stay_ON
%SystemRoot%\explorer.exe "%destination%"
exit

:turn_OFF
SHUTDOWN /p
exit









: GUIDELINES

: /XO :: eXclude Older files.
: /MAXAGE:n :: MAXimum file AGE - exclude files older than n days/date.

: /S :: copy Subdirectories, but not empty ones.
: /E :: copy subdirectories, including Empty ones.
: /PURGE :: delete dest files/dirs that no longer exist in source.
: /MIR :: Mirror a directory tree (equivalent to /E plus /PURGE).
: /XA:[RASHCNETO] :: eXclude files with any of the given Attributes set. (H: Hidden)

: /R:n :: number of Retries on failed copies: default 1 million.
: /W:n :: Wait time between retries: default is 30 seconds.