ECHO Injecting Cactbot into %2 %1
XCOPY "%~dp0Cactbot\OverlayPlugin\*" "%~dp0Build\%2\%1\" /E /I /Y /exclude:full.exclude

SET ZIP="%ProgramFiles%\7-Zip\7z.exe" a -tzip

%ZIP% OverlayPlugin.Full.Standard.%1.x64.zip "%~dp0\Build\release\x64\*" -xr@full.exclude
%ZIP% OverlayPlugin.Full.Streamer.%1.x64.zip "%~dp0\Build\streamer\x64\*" -xr@full.exclude
%ZIP% OverlayPlugin.Full.Standard.%1.x86.zip "%~dp0\Build\release\x86\*" -xr@full.exclude
%ZIP% OverlayPlugin.Full.Streamer.%1.x86.zip "%~dp0\Build\streamer\x86\*" -xr@full.exclude

cd "%~dp0\Build\release\x64\"
%ZIP% "%~dp0\OverlayPlugin.Update.Standard.%1.x64.zip" -ir@"%~dp0\update.include"
cd "%~dp0\Build\streamer\x64\"
%ZIP% "%~dp0\OverlayPlugin.Update.Streamer.%1.x64.zip" -ir@"%~dp0\update.include"
cd "%~dp0\Build\release\x86\"
%ZIP% "%~dp0\OverlayPlugin.Update.Standard.%1.x86.zip" -ir@"%~dp0\update.include"
cd "%~dp0\Build\streamer\x86\"
%ZIP% "%~dp0\OverlayPlugin.Update.Streamer.%1.x86.zip" -ir@"%~dp0\update.include"