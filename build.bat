@SETLOCAL
@ECHO off
SET VERSION=0.3.4.0.EZS.Enmity-1.9.2.01.Cactbot-0.6.2
ECHO "Removing Old Build..."
CALL CLEAN

ECHO @echo off > createInstaller.bat
ECHO SET VERSION=%VERSION% >> createInstaller.bat
ECHO call "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" %~dp0installer.iss /dMyAppVersion=%VERSION% >> createInstaller.bat

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

ECHO "Inject Cactbot"
PAUSE

ECHO "Releases..."
CALL buildReleases %VERSION% >> buildlog.txt


ECHO "Building Installer..."
call %~dp0createInstaller.bat

:END
PAUSE
@ENDLOCAL
