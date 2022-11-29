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

echo/
echo/
echo/
echo/ This script will move most files from your desktop to organised folders by type for easy archiving!

pause


: Documents
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\PDF" *.pdf /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\Excel" *.xlsx /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\Excel" *.xls /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\Excel" *.csv /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\Word" *.docx /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\Word" *.doc /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DOC\TXT" *.txt /MOV

: Images
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\IMG" *.jpg /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\IMG" *.png /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\IMG" *.jpeg /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\IMG" *.psd /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\IMG" *.tga /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\IMG" *.tiff /MOV

: ZIP
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\ZIP" *.zip /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\ZIP" *.rar /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\ZIP" *.bz2 /MOV

: Video
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\VID" *.mp4 /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\VID" *.mov /MOV


: Audio
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\AUD" *.mp3 /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\AUD" *.wma /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\AUD" *.wav /MOV


: Design
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DWG" *.dwf /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DWG" *.dwg /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DWG" *.r* /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DWG" *.nw* /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DWG" *.max /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\DWG" *.dyn /MOV

: Coding
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.sh /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.bat /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.bash /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.swift /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.py /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE\EncKeys" *.key /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.py /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.py /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.py /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.py /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\CODE" *.py /MOV


: Setup
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\SETUP" *.exe /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\SETUP" *.dmg /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\SETUP" *.linux /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\SETUP" *.crx /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\SETUP" *.apk /MOV
robocopy "%USERPROFILE%\Desktop" "%USERPROFILE%\Desktop\_CLEANING_\SETUP" *.bin /MOV


: Remove redundancy
robocopy "%USERPROFILE%\Desktop\_CLEANING_" "%USERPROFILE%\Desktop\-CLEANING-" *.* /MOVE /S /R:2 W:5