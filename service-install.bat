@echo off
SET THISNAME=iedusm
REM installutil %THISNAME%.exe
SET THIS_PATH=%~dp0
IF EXIST "%THIS_PATH%\bin\Release\%THISNAME%.exe" "%THIS_PATH%\bin\Release\%THISNAME%.exe" -install
IF NOT EXIST "%THIS_PATH%\bin\Release\%THISNAME%.exe" "%THIS_PATH%\bin\Debug\%THISNAME%.exe" -install
echo Now to go services.msc and do the following:
echo * change Startup type to "Start automatically"
echo * in "Log On" tab:
echo   * change "Log on as" to "Local System account"
echo   * "Allow service to interact with the desktop": yes
echo * Recovery (default is Take No Action)
echo   * First failure: "Restart the Service" 
echo   * Second failure: "Restart the Service" 
echo   * "Reset fail count after": 1 days (default is 0)
echo * OK, right-click the service, Start.
pause