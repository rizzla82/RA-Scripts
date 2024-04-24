cd D:\DataG\PS_Scripts\VMWare

Get-VM | Sort | 
   Get-View -Property @("Name", "Config.GuestFullName", "Guest.GuestFullName", "Guest.IpAddress") | 
   Select -Property Name, 
       @{N="Configured OS";E={$_.Config.GuestFullName}},
       @{N="Running OS";E={$_.Guest.GuestFullName}},
       @{N="IP Address";E={@($_.Guest.IpAddress)}} | 
   Export-CSV -Delimiter ";" -Path "vms.csv"
