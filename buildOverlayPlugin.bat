@ECHO off

set DOTNET_PATH=%windir%\Microsoft.NET\Framework\v4.0.30319
if not exist %DOTNET_PATH% (
	echo エラー: .NET Framework のディレクトリが見つかりません。ビルドを実行するためには .NET Framework 4.5.1 がインストールされている必要があります。
	goto END
)

%DOTNET_PATH%\msbuild /t:Rebuild /p:Configuration=%2 /p:Platform=%1 /p:OutputPath="%~dp0\Build\%2\%1" "%~dp0\..\OverlayPlugin\OverlayPlugin.sln"

DEL "%~dp0\Build\%2\%1\Advanced Combat Tracker.exe"

call buildOverlayThemes %1 %2
call buildEnmityPlugin %1 %2

:END