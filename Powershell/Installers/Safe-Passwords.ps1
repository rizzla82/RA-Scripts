$cred = Get-Credential -Message 'Enter Credential'

$cred

$cred.GetNetworkCredential().Password

$cred | Export-Clixml -Path ./credential.xml

code ./credential.xml

$importedCred = Import-Clixml -Path ./credential.xml

$importedCred 

$importedCred.GetNetworkCredential().Password
