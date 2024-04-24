# Azure Password Check All Users #

Get-AzureADUser -All $true | Select-Object UserprincipalName,@{
    N="PasswordNeverExpires";E={$_.PasswordPolicies -contains "DisablePasswordExpiration"}
 }

# Set a password to Expire

Set-AzureADUser -ObjectId veeam_vbo@your-domain.com -PasswordPolicies None

# Azure Password Check Single Users
 Get-AzureADUser -ObjectId veeam_vbo@your-domain.com | Select-Object UserprincipalName,@{
    N="PasswordNeverExpires";E={$_.PasswordPolicies -contains "DisablePasswordExpiration"}
 }

# Set a password to never expire

Get-AzureADUser -ObjectId veeam_vbo@your-domain.com | Set-AzureADUser -PasswordPolicies DisablePasswordExpiration
