@echo off
setlocal enableDelayedExpansion


for /d %%i in (*) do (
    cd "%%i" 
    echo working on %%i ...

    for %%j in (*.jpg) do ..\jpegoptim-32.exe -s %%j
    cd ..
)

pause
