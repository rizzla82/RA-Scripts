function New-MDTVM {
 
param
(
    [Parameter(Mandatory=$true)]
    [string]$Computername,
    [string]$CPU = '2',
    [string]$Memory = '4',
    [string]$DiskSpace = '40',
    [string]$DataStore = 'Corporate_5',
    [string]$NetworkName = 'ITVLAN95',
    [string]$LiteTouchPath = 'iso_files\LiteTouchPE_x64.iso',
    [string]$GuestOS = 'windows9Server64Guest',
    [string]$VMHost = 'hulk',
    [string]$VCenter = ‘vcenter’
)
 
    Connect-VIServer $VCenter
    New-VM -Name $ComputerName -GuestId $GuestOS -VMHost $VMHost -Version v11 -DiskGB $DiskSpace -Datastore $Datastore -MemoryGB $Memory -NumCpu $CPU -NetworkName $NetworkName -CD
    Get-VM -Name $ComputerName | Get-CDDrive | Set-CDDrive -IsoPath "[$Datastore] $LiteTouchPath" -Confirm:$false -StartConnected:$true
    Start-VM -VM $ComputerName -Confirm:$False
    Start-Sleep -Seconds 60
    Get-CDDrive -VM $ComputerName | Set-CDDrive -NoMedia -Confirm:$False
}



