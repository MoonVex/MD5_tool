@echo off
:: Prompt for file path
set /p filepath=Enter the file path (full path or relative path):

:: Check if file exists
if not exist "%filepath%" (
    echo File does not exist. Please check the path!
    pause
    exit /b
)

:: Extract file name without extension
for %%a in ("%filepath%") do set filename=%%~na
for %%a in ("%filepath%") do set filedir=%%~dpa

:: Set output file name
set outputfile=%filedir%%filename%_md5.txt

:: Calculate MD5 and save to a temporary file
certutil -hashfile "%filepath%" MD5 > tmp.txt

:: Extract the second line from tmp.txt (MD5 value) and save to output file
for /f "skip=1 delims=" %%a in (tmp.txt) do (
    echo %%a > "%outputfile%"
    goto done
)
:done

:: Clean up temporary file
del tmp.txt

echo MD5 has been saved to "%outputfile%".
pause
