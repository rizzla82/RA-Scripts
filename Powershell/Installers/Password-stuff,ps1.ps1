Get-Module

Get-InstalledModule

Install-Module -Name CredentialManager

Import-Module CredentialManager

get-help Get-StoredCredential -Online

get-help New-StoredCredential -online

New-StoredCredential -Target ss-server01 -UserName File-user -Password Good-Password-for-today

New-StoredCredential -Target ss-server02 -UserName File-user -Password Good-Password-for-today

Get-StoredCredential -Target ss-server02

# Removes modules from the current session.
Remove-Module CredentialManager
