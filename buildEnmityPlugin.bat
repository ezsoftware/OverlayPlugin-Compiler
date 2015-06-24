IF NOT EXIST "%~dp0\..\ACT_EnmityPlugin\Thirdparty\ACT\Advanced Combat Tracker.exe" (
	XCOPY "%ProgramFiles(x86)%\Advanced Combat Tracker\Advanced Combat Tracker.exe" "%~dp0\..\ACT_EnmityPlugin\Thirdparty\ACT\" /E /I /Y
)

IF NOT EXIST "%~dp0\..\ACT_EnmityPlugin\Thirdparty\OverlayPlugin\OverlayPlugin.Core.dll" (
	XCOPY "%~dp0\Build\%2\%1\OverlayPlugin.Core.dll" "%~dp0\..\ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /E /I /Y
)

IF NOT EXIST "%~dp0\..\ACT_EnmityPlugin\Thirdparty\OverlayPlugin\OverlayPlugin.Common.dll" (
	XCOPY "%~dp0\Build\%2\%1\OverlayPlugin.Common.dll" "%~dp0\..\ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /E /I /Y
)

IF NOT EXIST "%~dp0\..\ACT_EnmityPlugin\Thirdparty\OverlayPlugin\HtmlRenderer.dll" (
	XCOPY "%~dp0\Build\%2\%1\HtmlRenderer.dll" "%~dp0\..\ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /E /I /Y
)

IF NOT EXIST "%~dp0\..\ACT_EnmityPlugin\Thirdparty\FFXIV_ACT_Plugin\FFXIV_ACT_Plugin.dll" (
	XCOPY "%AppData%\Advanced Combat Tracker\Plugins\FFXIV_ACT_Plugin.dll" "%~dp0\..\ACT_EnmityPlugin\Thirdparty\FFXIV_ACT_Plugin\" /E /I /Y
)
set DOTNET_PATH=%windir%\Microsoft.NET\Framework\v4.0.30319
%DOTNET_PATH%\msbuild /t:Rebuild /p:Configuration=Release /p:Platform="Any CPU" /p:OutputPath="%~dp0\Build\%2\%1" "%~dp0\..\ACT_EnmityPlugin\EnmityPlugin.sln"

XCOPY "%~dp0enmity.en.html" "%~dp0Build\%2\%1\resources\" /Y

:END