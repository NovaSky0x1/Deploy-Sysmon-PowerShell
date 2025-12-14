# Download Sysmon
$sysmonUrl = "https://download.sysinternals.com/files/Sysmon.zip"
$configUrl = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"

$downloadPath = "C:\Sysmon"
New-Item -ItemType Directory -Path $downloadPath -Force

# Download and extract Sysmon
Invoke-WebRequest -Uri $sysmonUrl -OutFile "$downloadPath\Sysmon.zip"
Expand-Archive -Path "$downloadPath\Sysmon.zip" -DestinationPath $downloadPath -Force

# Download SwiftOnSecurity config
Invoke-WebRequest -Uri $configUrl -OutFile "$downloadPath\sysmonconfig.xml"

# Install Sysmon with config (64-bit)
& "$downloadPath\Sysmon64.exe" -accepteula -i "$downloadPath\sysmonconfig.xml"

Write-Host "Sysmon installed. Verify with: Get-Service sysmon64"
