Install-PackageProvider -Name NuGet -Force

Get-InstalledModule


Find-Module -Name VMware.PowerCLI
Install-Module -Name VMware.PowerCLI -AllowClobber -Scope CurrentUser
Get-Command -Module *VMWare*

Find-Module -Name AzureAD, MSOnline, EXchangeOnlineManagement

Install-Module -Name AzureAD, MSOnline, EXchangeOnlineManagement

Find-Module CredentialManager

Install-Module CredentialManager

Get-Module VMware.* -ListAvailable | Uninstall-Module -Force

(Get-Module VMware.PowerCLI -ListAvailable).RequiredModules | Uninstall-Module -Force