#define PackageName      "Biomass Harvest"
#define PackageNameLong  "Biomass Harvest Extension"
#define Version          "3.2"
#define ReleaseType      "official"

#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#include "package (Setup section) v6.0.iss"
#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"

[Files]
; The extension's assembly
Source: ..\src\bin\Debug\Landis.Extension.BiomassHarvest.dll; DestDir: {#ExtDir}; Flags: replacesameversion 

; Harvest libraries
; Note: Since they are used by other extensions, they are not uninstalled.
Source: ..\src\bin\Debug\Landis.Library.BiomassCohorts-v2.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.Biomass-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.BiomassHarvest-v2.dll;    DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.HarvestManagement-v1.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.SiteHarvest-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.Metadata.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall

Source: docs\LANDIS-II Biomass Harvest v3.1 User Guide.pdf; DestDir: {#AppDir}\docs
Source: examples\*.txt; DestDir: {#AppDir}\examples\base-wind
Source: examples\ecoregions.gis; DestDir: {#AppDir}\examples\base-wind
Source: examples\initial-communities.gis; DestDir: {#AppDir}\examples\base-wind
Source: examples\*.bat; DestDir: {#AppDir}\examples\base-wind

#define BaseHarvest "Biomass Harvest 3.0.txt"
Source: {#BaseHarvest}; DestDir: {#LandisPlugInDir}

[Run]
;; Run plug-in admin tool to add the entry for the plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"

Filename: {#PlugInAdminTool}; Parameters: "remove ""Biomass Harvest"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#BaseHarvest}"" "; WorkingDir: {#LandisPlugInDir}

[Code]
{ Check for other prerequisites during the setup initialization }
#include "package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;