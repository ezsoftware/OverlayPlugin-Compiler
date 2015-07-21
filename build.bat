@SETLOCAL
@ECHO off
SET VERSION=0.3.3.8.EZS.Enmity-1.6.2.0
ECHO "Removing Old Build..."
CALL CLEAN

ECHO "Locating ACT..."
SET OP_DIR=%~dp0OverlayPlugin
SET ACT=Advanced Combat Tracker.exe
IF EXIST "%ProgramFiles(x86)%\Advanced Combat Tracker\%ACT%" (
	XCOPY "%ProgramFiles(x86)%\Advanced Combat Tracker\%ACT%" "%OP_DIR%\Thirdparty\ACT\" /E /Y
) ELSE (
	ECHO "ACT Not Found, please install Advanced Combat Tracker";
	GOTO END
)
ECHO "ACT Found."
ECHO "Building OverlayPlugin..."
ECHO "x86 release..."
CALL buildOverlayPlugin x86 release >> buildlog.txt
ECHO "x64 release..."
CALL buildOverlayPlugin x64 release >> buildlog.txt
ECHO "x86 streamer..."
CALL buildOverlayPlugin x86 streamer >> buildlog.txt
ECHO "x64 streamer..."
CALL buildOverlayPlugin x64 streamer >> buildlog.txt
ECHO "Releases..."
CALL buildReleases %VERSION% >> buildlog.txt


:END
PAUSE
@ENDLOCAL
