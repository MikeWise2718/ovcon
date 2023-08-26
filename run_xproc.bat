@echo off

setlocal

pushd "%~dp0"

set ROOT_DIR=%~dp0
set USD_LIB_DIR=%ROOT_DIR%_build\windows-x86_64\release
set PYTHON=%ROOT_DIR%_build\target-deps\python\python.exe
set OVDIR1=d:\nv\ov\pkg\code-2022.3.3\extscache\omni.warp-0.7.2\warp\bin
set OVDIR2=d:\nv\ov\pkg\code-2022.3.3\kit\python
set OVDIR3=d:\nv\ov\pkg\code-2022.3.3\kit\libs\mdl
set OVDIR4=d:\nv\ov\pkg\code-2022.3.3\kit\extscore\omni.kit.pip_archive\pip_prebundle\numpy\.libs
set OVDIR5=d:\nv\ov\pkg\code-2022.3.3\extscache\omni.isaac.core_archive-2.0.1+104.1.wx64\pip_prebundle\scipy\.libs
set OVDIR6=D:\nv\ov\pkg\code-2022.3.3\kit\extscore\omni.usd.libs\bin
set OVDIR7=D:\nv\ov\pkg\code-2022.3.3\kit\extscore\omni.usd\bin

set PATH=%PATH%;%USD_LIB_DIR%
set PATH=%PATH%;%OVDIR1%
set PATH=%PATH%;%OVDIR2%
set PATH=%PATH%;%OVDIR3%
set PATH=%PATH%;%OVDIR4%
set PATH=%PATH%;%OVDIR5%
set PATH=%PATH%;%OVDIR6%
set PATH=%PATH%;%OVDIR7%

set PYTHONPATH=%USD_LIB_DIR%\python;%USD_LIB_DIR%\bindings-python
set CARB_APP_PATH=%USD_LIB_DIR%

if not exist "%PYTHON%" (
    echo Python, USD, and Omniverse Client libraries are missing.  Run prebuild.bat to retrieve them.
    popd
    exit /b
)

"%PYTHON%" source\xproc\xproc.py %*

popd

EXIT /B %ERRORLEVEL%