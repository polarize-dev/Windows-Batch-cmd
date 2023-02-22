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




: Choose an operaton
:Choose1
    set /P choice=What do you want to do with Revit Jornals [Copy, Delete, Open]?
        if /I "%choice%" EQU "" goto :Choose1
        if /I "%choice%" EQU "copy" goto :destinationP
        if /I "%choice%" EQU "delete" goto :delVer
        if /I "%choice%" EQU "open" goto :askOpen
exit


:delVer
    set /P version=Which Revit Version you want to access [YYYY] or [All] for all versions?
        if /I "%version%" EQU "" goto :delVer
        if /I "%version%" EQU "all" goto :deleteAll
    goto :deleteVer
exit

:askOpen
    set /P version=Which Revit Version you want to access [YYYY] or [All] for all versions?
        if /I "%version%" EQU "" goto :askOpen
    goto :open
exit

: Choose a directory
:destinationP
    set /P destination=What is the [DESTINATION] path?
        if /I "%destination%" EQU "" goto :destinationP



:Ver
    set /P version=Which Revit Version you want to access [YYYY] or [All] for all versions?
        if /I "%version%" EQU "" goto :Ver
        if /I "%version%" EQU "all" goto :all
    goto :versionselected

exit




:versionselected
robocopy "%localappdata%\autodesk\Revit\Autodesk Revit %version%\Journals" "%destination%\RVT %version%" *.* /E /XA:H /R:2 W:5
exit

:all
robocopy "%localappdata%\autodesk\Revit\Autodesk Revit 2019\Journals" "%destination%\RVT 2019" *.* /E /XA:H /R:2 W:5
robocopy "%localappdata%\autodesk\Revit\Autodesk Revit 2020\Journals" "%destination%\RVT 2020" *.* /E /XA:H /R:2 W:5
robocopy "%localappdata%\autodesk\Revit\Autodesk Revit 2021\Journals" "%destination%\RVT 2021" *.* /E /XA:H /R:2 W:5
robocopy "%localappdata%\autodesk\Revit\Autodesk Revit 2022\Journals" "%destination%\RVT 2022" *.* /E /XA:H /R:2 W:5
robocopy "%localappdata%\autodesk\Revit\Autodesk Revit 2023\Journals" "%destination%\RVT 2023" *.* /E /XA:H /R:2 W:5
exit



:deleteVer
rd "%localappdata%\autodesk\Revit\Autodesk Revit %version%\Journals" /s /Q
exit

:deleteAll
rd "%localappdata%\autodesk\Revit\Autodesk Revit 2019\Journals" /s /Q
rd "%localappdata%\autodesk\Revit\Autodesk Revit 2020\Journals" /s /Q
rd "%localappdata%\autodesk\Revit\Autodesk Revit 2021\Journals" /s /Q
rd "%localappdata%\autodesk\Revit\Autodesk Revit 2022\Journals" /s /Q
rd "%localappdata%\autodesk\Revit\Autodesk Revit 2023\Journals" /s /Q
exit


:open
%SystemRoot%\explorer.exe "%localappdata%\autodesk\Revit\Autodesk Revit %version%\Journals"

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