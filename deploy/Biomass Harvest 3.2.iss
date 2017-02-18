#define PackageName      "Biomass Harvest"
#define PackageNameLong  "Biomass Harvest Extension"
#define Version          "3.2"
#define ReleaseType      "official"

#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#include "package (Setup section) v6.0.iss"
#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"
#define LandisPlugInDir "C:\Program Files\LANDIS-II\plug-ins"
#define LandisExtInfo "C:\Program Files\LANDIS-II\v6\ext-info"

[Files]
; The extension is this .dll (ie, the extension's assembly)
; NB: Do not put a version number in the file name of this .dll in the VS (build) .csproj file
Source: ..\src\bin\Debug\Landis.Extension.BiomassHarvest.dll; DestDir: {#ExtDir}; Flags: replacesameversion 

; Requisite auxiliary libraries
; NB. These libraries are used by other extensions and thus are never uninstalled.
Source: ..\src\bin\Debug\Landis.Library.BiomassCohorts-v2.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.Biomass-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.BiomassHarvest-v2.dll;    DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.HarvestManagement-v2.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.SiteHarvest-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.Metadata.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall

;User Guides no longer shipped with installer
;Source: docs\LANDIS-II Biomass Harvest v3.1 User Guide.pdf; DestDir: {#AppDir}\docs

;Complete example for testing
Source: example\*.txt; DestDir: {#AppDir}\examples\Biomass Harvest
Source: example\ecoregions.gis; DestDir: {#AppDir}\examples\Biomass Harvest
Source: example\initial-communities.gis; DestDir: {#AppDir}\examples\Biomass Harvest
Source: example\*.bat; DestDir: {#AppDir}\examples\Biomass Harvest

;LANDISII identifies the extension with the info in this .txt file
; New releases must modify the name of this file and the info in it
#define InfoTxt "Biomass Harvest 3.2.txt"
Source: {#InfoTxt}; DestDir: {#LandisPlugInDir}
Source: {#InfoTxt}; DestDir: {#LandisExtInfo}

[Run]
; Run plug-in admin tool to add the entry for the plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"

Filename: {#PlugInAdminTool}; Parameters: "remove ""Biomass Harvest"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#InfoTxt}"" "; WorkingDir: {#LandisPlugInDir}

[Code]
{ Check for other prerequisites during the setup initialization }
#include "package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;