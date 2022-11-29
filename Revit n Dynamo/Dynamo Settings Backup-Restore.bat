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
echo/ Backup Dynamo settings
: ____ DO NOT CHANGE THE CODE BELOW ____







for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%

set stamp=DynamoSettingsBackup_%YYYY%%MM%%DD%

:Question
	set /P ques=What do you want to do [Backup or Restore] choose [B, R]?
		if /I "%ques%" EQU "B" goto :Backup
		if /I "%ques%" EQU "R" goto :Restore
		goto :Question
		exit

:Backup
	set /P destination=Where do you want to save the backup [Path] or keep blank for Current folder?
		IF /I "%destination%"=="" (set destination=%CD%)

	robocopy "%UserProfile%\appdata\Roaming\Dynamo\Dynamo Revit" "%destination%\%stamp%" *.* /S /R:2 /W:5
	exit


:Restore
	set /P source=Where is the backup folder path [Path]?
		IF /I "%source%"=="" goto :Restore

	robocopy "%source%" "%UserProfile%\appdata\Roaming\Dynamo\Dynamo Revit" *.* /S /R:2 /W:5
	exit