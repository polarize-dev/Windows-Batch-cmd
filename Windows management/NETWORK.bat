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



echo/            !! RUN AS ADMINSTRATOR !!
echo/
echo/


: Select a choice
:choice
    set /P choiceSelect=What do you want to do: Get IP, Disable, Enable or Reset [IP, D, E or R]?
        
        if /I "%choiceSelect%" EQU "ip" goto :IP
        if /I "%choiceSelect%" EQU "d" goto :Disable
        if /I "%choiceSelect%" EQU "e" goto :Enable
        if /I "%choiceSelect%" EQU "r" goto :Reset

        if /I "%choiceSelect%" EQU "IP" goto :IP
        if /I "%choiceSelect%" EQU "D" goto :Disable
        if /I "%choiceSelect%" EQU "E" goto :Enable
        if /I "%choiceSelect%" EQU "R" goto :Reset
    goto :choice


:IP
    ipconfig
    pause
exit

:Disable
    netsh interface set interface Wi-Fi disable
    netsh interface set interface Ethernet disable
    netsh interface show interface
exit



:Enable
    netsh interface set interface Wi-Fi enable
    netsh interface set interface Ethernet enable
    netsh interface show interface
exit


:Reset
    ipconfig /release
    ipconfig /renew
    : create a persistent ping to the network to see when connected to the internet
    ping 4.2.2.2
    pause