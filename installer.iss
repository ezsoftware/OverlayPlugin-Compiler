; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#include <idp.iss>

#define MyAppName "ACT OverlayPlugin Bundle"
#define MyAppVersion "0.3.3.8.EZS.Enmity-1.5.0.1"
#define MyAppPublisher "RainbowMage, XTuaok and EZSoftware"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3B3BF832-DBE9-46AD-AF44-4B7E836F1788}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf32}\Advanced Combat Tracker\OverlayPlugin
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=C:\Users\john_000\Repos\Personal\OverlayPlugin\LICENSE.txt
OutputDir=C:\Users\john_000\Repos\Personal\OverlayPlugin-Compiler
OutputBaseFilename=OverlayPluginSetup.{#MyAppVersion}
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: full_standard; Description: "Full Standard Version - Recommended for most people";
Name: full_streamer; Description: "Full Streamer Version - Allows Overlay Windows to be selectable by streaming software *DOES NOT WORK WITH OBS*";
Name: update_standard; Description: "Update Standard Version";
Name: update_streamer; Description: "Update Streamer Version";

[Components]
Name: full_standard; Description: "Full"; Types: full_standard;
Name: full_streamer; Description: "Full"; Types: full_streamer;
Name: update_standard; Description: "Update"; Types: update_standard;
Name: update_streamer; Description: "Update"; Types: update_streamer;

[Files]
Source: "C:\Program Files\7-Zip\7za.exe"; DestDir: "{tmp}"; Flags: dontcopy
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Code]
var
   unzipTool: String;
   file: String;
   ReturnCode: Integer;
   targetPath: String;
   full_update: String;
   standard_streamer: String;
   x64_x86: String;
procedure DoUnzip(source: String; targetdir: String);
begin
    ExtractTemporaryFile('7za.exe');
    // source contains tmp constant, so resolve it to path name
    source := ExpandConstant(source);
    unzipTool := ExpandConstant('{tmp}\7za.exe');

    if not FileExists(unzipTool)
    then MsgBox('UnzipTool not found: ' + unzipTool, mbError, MB_OK)
    else if not FileExists(source)
    then MsgBox('File was not found while trying to unzip: ' + source, mbError, MB_OK)
    else begin
         if Exec(unzipTool, ' x "' + source + '" -o"' + targetdir + '" -y',
                 '', SW_HIDE, ewWaitUntilTerminated, ReturnCode) = false
         then begin
             MsgBox('Unzip failed:' + source, mbError, MB_OK)
         end;
    end;
end;
procedure InitializeWizard();
begin
    idpDownloadAfter(wpReady);
end;
procedure CurPageChanged(CurPageID: Integer);
begin
    if CurPageID = wpReady then
    begin
      targetPath := ExpandConstant('{tmp}\OverlayPlugin.zip')
      idpClearFiles;
      if IsComponentSelected('full_standard') or IsComponentSelected('full_streamer') then full_update := 'Full' else full_update := 'Update';
      if IsComponentSelected('full_standard') or IsComponentSelected('update_standard') then standard_streamer := 'Standard' else standard_streamer := 'Streamer';
      if IsWin64 then x64_x86 := 'x64' else x64_x86 := 'x86';
      file := 'https://github.com/ezsoftware/OverlayPlugin-Compiler/releases/download/v{#MyAppVersion}/OverlayPlugin.' + full_update + '.' 
        + standard_streamer + '.{#MyAppVersion}.' + x64_x86 + '.zip';
      idpAddFile(file, ExpandConstant(targetPath)); 
    end;
end;
procedure CurStepChanged(CurStep: TSetupStep);
begin
    if CurStep = ssPostInstall then 
    begin
        DoUnzip(targetPath, ExpandConstant('{app}'));
    end;
end;