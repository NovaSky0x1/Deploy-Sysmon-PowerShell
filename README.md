# Deploy-Sysmon-PowerShell

A quick PowerShell script to deploy Sysmon with the SwiftOnSecurity configuration.

## What it does

- Downloads Sysmon from Microsoft Sysinternals
- Downloads the SwiftOnSecurity sysmon-config ruleset
- Installs Sysmon as a service with the config applied

## Requirements

- Windows (tested on Windows 10/11, Server 2016+)
- PowerShell 5.1+
- Administrator privileges
- Internet connectivity

## Usage

Run PowerShell as Administrator:
```powershell
.\deploy-sysmon.ps1
```

## Verify Installation
```powershell
Get-Service Sysmon64
Get-WinEvent -LogName "Microsoft-Windows-Sysmon/Operational" -MaxEvents 5
```

## Log Location

Event Viewer → Applications and Services Logs → Microsoft → Windows → Sysmon → Operational

## Update Config

To update the config without reinstalling:
```powershell
Sysmon64.exe -c C:\Sysmon\sysmonconfig.xml
```

## Uninstall
```powershell
Sysmon64.exe -u
```

## Credits

- [Sysmon](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon) - Microsoft Sysinternals
- [sysmon-config](https://github.com/SwiftOnSecurity/sysmon-config) - SwiftOnSecurity# Deploy-Sysmon-PowerShell
