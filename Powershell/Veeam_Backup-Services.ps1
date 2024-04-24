Get-Service | Where-Object {$_.DisplayName.StartsWith("Veeam")} | Stop-Service
Get-Service | Where-Object {$_.DisplayName.StartsWith("Veeam")} | Start-Service

