Get-Content Cmdlets.txt -TotalCount 5)[-1] 

  

Get-Content C:\windows\WindowsUpdate.log -Tail 10 -Wait 

  

Get-Content C:\inetpub\logs\LogFiles\W3SVC1\u_ex170224.log -Tail 20 -Wait 

  

Get-Content C:\inetpub\logs\LogFiles\W3SVC1\u_ex170224.log -Wait 

  

u_ex170224.log 

  

PS C:\>Get-Content c:\Logs\Log060912.txt -TotalCount 50 | Set-Content Sample.txt 

  

get-eventlog -newest 10 -logname "Application" 

  

To check for updates, 

  

wuauclt.exe /detectnow 

  

To check and update, 

  

wuauclt.exe /detectnow /updatenow 

  

sfc /scannow 

  

get-aduser 

  

Get-ADUser zbackup -Properties * | Select * 

  

Get-ADComputer -Filter * -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion -Wrap –Auto 

  

Get-ADComputer -Filter {OperatingSystem -Like “*Server*”} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack -Wrap -Auto 

  

  

Get-ADComputer -Filter {OperatingSystem -Like “Server*”} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack -Wrap -Auto 

  

Get-ADComputer -Filter * -properties *|select Name, DNSHostName, OperatingSystem, LastLogonDate | Out-GridView 

  

Get-ADComputer -Filter {OperatingSystem -Like “Windows *Server*”} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack -Wrap -Auto 
