# https://docs.microsoft.com/en-us/powershell/module/azuread/get-azureaddevice?view=azureadps-2.0

# cd D:\DataG\PS_Scripts\modules\PowerCli

# Save-Module -Name VMware.PowerCLI -Path D:\DataG\PS_Scripts\modules\PowerCLI

# Install-Module -Name VMware.PowerCLI -scope CurrentUser -Force -AllowClobber

# Get-Module -ListAvailable -Name VMware*

# Install-Module CredentialManager -force

# $vmwareCred = Get-Credential raadm

# Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

# connect-viserver ldnwinvc01 -Credential $vmwareCred

#connect-viserver 192.168.20.15 -Credential $vmwareCred

#Disconnect-VIServer

# New Way to connect

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

connect-viserver ldnwinvc01

# Get-VICredentialStoreItem -Host ldnwinvc01

# Connect-VIServer "ldnwinvc01" -User raadm -Password password -SaveCredentials

