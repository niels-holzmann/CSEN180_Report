@echo off
setlocal enabledelayedexpansion


:: Capture start time
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /a "start_h=%%a"
    set /a "start_m=%%b"
    set /a "start_s=%%c"
    set /a "start_cs=1%%d-100"
)


:: search command
powershell -Command Get-ChildItem -Path . -Recurse -Filter "hazard3_rvfi_wrapper.v" >nul
::powershell -Command Get-ChildItem -Path . -Recurse -Include "Makefile", "*main.c" >nul

:: Capture end time
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /a "end_h=%%a"
    set /a "end_m=%%b"
    set /a "end_s=%%c"
    set /a "end_cs=1%%d-100"
)


:: Convert times to centiseconds since midnight
set /a "start_totalcs=(start_h*3600 + start_m*60 + start_s)*100 + start_cs"
set /a "end_totalcs=(end_h*3600 + end_m*60 + end_s)*100 + end_cs"


:: Handle midnight rollover
if %end_totalcs% LSS %start_totalcs% (
    set /a "end_totalcs+=24*60*60*100"
)


:: Calculate elapsed time
set /a "elapsed_cs=end_totalcs-start_totalcs"
set /a "elapsed_s=elapsed_cs / 100"
set /a "elapsed_frac=elapsed_cs %% 100"


:: Display results
echo Start time: %start_h%:%start_m%:%start_s%.%start_cs%
echo End time: %end_h%:%end_m%:%end_s%.%end_cs%
echo Elapsed time: %elapsed_s%.%elapsed_frac% seconds


endlocal
