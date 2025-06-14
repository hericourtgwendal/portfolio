@echo off
setlocal

REM Set the path to the browser folder inside docs
set "browserFolder=docs\browser"
set "parentFolder=docs"

REM Check if the browser folder exists
if not exist "%browserFolder%\" (
    echo Folder "%browserFolder%" does not exist.
    exit /b 1
)

REM Move all contents of browser folder to its parent
move "%browserFolder%\*" "%parentFolder%\" >nul

REM Remove the now-empty browser folder
rmdir "%browserFolder%"

REM Copy index.html to 404.html inside docs
if exist "%parentFolder%\index.html" (
    copy /Y "%parentFolder%\index.html" "%parentFolder%\404.html" >nul
    echo Done.
) else (
    echo index.html not found in %parentFolder%!
)

endlocal
