$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

$OLM_VERSION = (Get-Content pubspec.yaml | .\scripts\yq_windows_386.exe .dependencies.flutter_olm)

$DOWNLOAD_PATH = "https://github.com/famedly/olm/releases/download/v$OLM_VERSION/olm.zip"

Set-Location assets/js
Invoke-WebRequest -Uri $DOWNLOAD_PATH -OutFile olm.zip

Expand-Archive -Path olm.zip -DestinationPath .
Remove-Item -Force olm.zip
Rename-Item -Path javascript -NewName package
Set-Location ../..