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



:choice
set /P address=Where do you want to create SCHEMA BIM file system [Path] or keep blank for Current folder?
	IF /I "%address%"=="" (SET address=%CD%\SCH_FILE_SYS)



mkdir "%address%\00 BIM"
	mkdir "%address%\00 BIM\00 ARCH"
		mkdir "%address%\00 BIM\00 ARCH\00 DOC"
		mkdir "%address%\00 BIM\00 ARCH\01 NAVIS"
		mkdir "%address%\00 BIM\00 ARCH\02 CAD"
		mkdir "%address%\00 BIM\00 ARCH\03 ARCHIVE"
		mkdir "%address%\00 BIM\00 ARCH\04 P-SPECIFIC"
	mkdir "%address%\00 BIM\01 STR"
		mkdir "%address%\00 BIM\01 STR\00 DOC"
		mkdir "%address%\00 BIM\01 STR\01 NAVIS"
		mkdir "%address%\00 BIM\01 STR\02 CAD"
		mkdir "%address%\00 BIM\01 STR\03 ARCHIVE"
		mkdir "%address%\00 BIM\01 STR\04 P-SPECIFIC"
	mkdir "%address%\00 BIM\02 MEP"
		mkdir "%address%\00 BIM\02 MEP\00 MECHANICAL"
			mkdir "%address%\00 BIM\02 MEP\00 MECHANICAL\00 DOC"
			mkdir "%address%\00 BIM\02 MEP\00 MECHANICAL\01 NAVIS"
			mkdir "%address%\00 BIM\02 MEP\00 MECHANICAL\02 CAD"
			mkdir "%address%\00 BIM\02 MEP\00 MECHANICAL\03 ARCHIVE"
			mkdir "%address%\00 BIM\02 MEP\00 MECHANICAL\04 P-SPECIFIC"
		mkdir "%address%\00 BIM\02 MEP\01 ELECTRICAL"
			mkdir "%address%\00 BIM\02 MEP\01 ELECTRICAL\00 DOC"
			mkdir "%address%\00 BIM\02 MEP\01 ELECTRICAL\01 NAVIS"
			mkdir "%address%\00 BIM\02 MEP\01 ELECTRICAL\02 CAD"
			mkdir "%address%\00 BIM\02 MEP\01 ELECTRICAL\03 ARCHIVE"
			mkdir "%address%\00 BIM\02 MEP\01 ELECTRICAL\04 P-SPECIFIC"
		mkdir "%address%\00 BIM\02 MEP\02 PLUMBING"
			mkdir "%address%\00 BIM\02 MEP\02 PLUMBING\00 DOC"
			mkdir "%address%\00 BIM\02 MEP\02 PLUMBING\01 NAVIS"
			mkdir "%address%\00 BIM\02 MEP\02 PLUMBING\02 CAD"
			mkdir "%address%\00 BIM\02 MEP\02 PLUMBING\03 ARCHIVE"
			mkdir "%address%\00 BIM\02 MEP\02 PLUMBING\04 P-SPECIFIC"
	mkdir "%address%\00 BIM\03 COORDINATION"
		mkdir "%address%\00 BIM\03 COORDINATION\ARCHIVE"
	mkdir "%address%\00 BIM\04 BIM EXECUTION PLAN"
	mkdir "%address%\00 BIM\05 VISUALISATION"
		mkdir "%address%\00 BIM\05 VISUALISATION\00 WORKING"
			mkdir "%address%\00 BIM\05 VISUALISATION\00 WORKING\00 3DsMAX"
				mkdir "%address%\00 BIM\05 VISUALISATION\00 WORKING\00 3DsMAX\ARCHIVE"
			mkdir "%address%\00 BIM\05 VISUALISATION\00 WORKING\01 UE"
			mkdir "%address%\00 BIM\05 VISUALISATION\00 WORKING\02 LUMION"
		mkdir "%address%\00 BIM\05 VISUALISATION\01 REFERENCE"
		mkdir "%address%\00 BIM\05 VISUALISATION\02 RENDERING"
		mkdir "%address%\00 BIM\05 VISUALISATION\03 FINAL"
			mkdir "%address%\00 BIM\05 VISUALISATION\03 FINAL\IMG"
			mkdir "%address%\00 BIM\05 VISUALISATION\03 FINAL\VID"
		mkdir "%address%\00 BIM\05 VISUALISATION\04 TEMP"
	mkdir "%address%\00 BIM\06 PRESENTATION"
mkdir "%address%\01 BOM"
	mkdir "%address%\01 BOM\ARCHIVE"
mkdir "%address%\02 COMMUNICATIONS"
	mkdir "%address%\02 COMMUNICATIONS\IN"
	mkdir "%address%\02 COMMUNICATIONS\OUT"
mkdir "%address%\03 ISSUE"
mkdir "%address%\04 APPROVALS"
mkdir "%address%\05 CONSTRUCTION"
	mkdir "%address%\05 CONSTRUCTION\00 FABRICATION"
	mkdir "%address%\05 CONSTRUCTION\01 ASSEMBLY"
mkdir "%address%\06 TEMP"




:choice
set /P open=Do you want to open the folder [y]?
if /I "%open%" EQU "y" goto :openFolder
exit

:openFolder
%SystemRoot%\explorer.exe "%address%"
exit

