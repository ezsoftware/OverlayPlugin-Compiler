XCOPY "%ProgramFiles(x86)%\Advanced Combat Tracker\Advanced Combat Tracker.exe" "%~dp0ACT_EnmityPlugin\Thirdparty\ACT\" /Y

XCOPY "%~dp0Build\%2\%1\OverlayPlugin.dll" "%~dp0ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /Y

XCOPY "%~dp0Build\%2\%1\OverlayPlugin.Core.dll" "%~dp0ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /Y

XCOPY "%~dp0Build\%2\%1\OverlayPlugin.Common.dll" "%~dp0ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /Y

XCOPY "%~dp0Build\%2\%1\HtmlRenderer.dll" "%~dp0ACT_EnmityPlugin\Thirdparty\OverlayPlugin\" /Y

XCOPY "%AppData%\Advanced Combat Tracker\Plugins\FFXIV_ACT_Plugin.dll" "%~dp0ACT_EnmityPlugin\Thirdparty\FFXIV_ACT_Plugin\" /Y

CALL "%~dp0ACT_EnmityPlugin\build"

XCOPY "%~dp0ACT_EnmityPlugin\build\*" "%~dp0Build\%2\%1\" /E /I /Y

XCOPY "%~dp0enmity.en.html" "%~dp0Build\%2\%1\resources\" /Y

:END