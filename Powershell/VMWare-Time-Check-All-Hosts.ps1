# Time Check All Hosts

Get-VMHost |
Sort-Object Name |
Select-Object Name, @{N=”Cluster”;E={$_ |
Get-Cluster}}, @{N=”Datacenter”;E={$_ |
Get-Datacenter}}, @{N=“NTPServiceRunning“;E={($_ |
Get-VmHostService |
Where-Object {$_.key-eq “ntpd“}).Running}}, @{N=“StartupPolicy“;E={($_ |
Get-VmHostService |
Where-Object {$_.key-eq “ntpd“}).Policy}}, @{N=“NTPServers“;E={$_ |
Get-VMHostNtpServer}}, @{N="Date&Time";E={(get-view $_.ExtensionData.configManager.DateTimeSystem).QueryDateTime()}} |
format-table -autosize



Get-VMHost |
Sort-Object Name |
Select-Object Name, @{N=”Cluster”;E={$_ |
Get-Cluster}}, @{N=”Datacenter”;E={$_ |
Get-Datacenter}}, @{N=“NTPServiceRunning“;E={($_ |
Get-VmHostService |
Where-Object {$_.key-eq “ntpd“}).Running}}, @{N=“StartupPolicy“;E={($_ |
Get-VmHostService | Where-Object {$_.key-eq “ntpd“}).Policy}}, @{N=“NTPServers“;E={$_ |
Get-VMHostNtpServer}}, @{N="Date&Time";E={(get-view $_.ExtensionData.configManager.DateTimeSystem).QueryDateTime()}} |
Out-GridView
