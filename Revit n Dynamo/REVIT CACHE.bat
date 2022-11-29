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

: Choose a Revit Version
:versionChoice
    set /P version=What is the version of Revit you want to access [2023]?
        if /I "%version%"=="" goto :versionChoice

:choice
    set /P selection=What do you want to do [Clear BIM360 cache, view only] choose [C, V]?
        IF /I "%selection%"=="" goto :choice
        IF /I "%selection%"=="C" goto :clear
        IF /I "%selection%"=="V" goto :view
        exit



:clear
    rd "%LOCALAPPDATA%\Autodesk\Revit\Autodesk Revit %version%\CollaborationCache" /S /Q
    exit

:view
    %SystemRoot%\explorer.exe "%LOCALAPPDATA%\Autodesk\Revit\Autodesk Revit %version%\CollaborationCache"
    exit