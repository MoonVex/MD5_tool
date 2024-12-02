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

:: Set expected MD5 file name
set md5file=%filedir%%filename%_md5.txt

:: Check if MD5 file exists
if not exist "%md5file%" (
    echo MD5 file "%md5file%" does not exist. Please check the file!
    pause
    exit /b
)

:: Calculate current MD5 and save to tmp.txt
certutil -hashfile "%filepath%" MD5 > tmp.txt

:: Extract the second line (MD5 value) from tmp.txt
for /f "skip=1 delims=" %%a in (tmp.txt) do (
    set current_md5=%%a
    goto done
)
:done
:: Clean up temporary file
del tmp.txt

:: Trim spaces from the calculated MD5
set current_md5=%current_md5: =%

:: Read stored MD5 from the MD5 file
set /p stored_md5=<"%md5file%"

:: Trim spaces from the stored MD5
set stored_md5=%stored_md5: =%

:: Compare MD5 values
if "%current_md5%"=="%stored_md5%" (
    echo MD5 match!
) else (
    echo MD5 does not match!
    echo Current MD5: %current_md5%
    echo Stored MD5: %stored_md5%
)

pause
