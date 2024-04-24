New-VM -Name zldnlinit10 `
       -CD -CoresPerSocket 2 `
       -Datastore Corporate_5 `
       -DiskGB 65 `
       -GuestId windows9Server64Guest `
       -MemoryGB 6 `
       -NetworkName ITVLAN95 `
       -NumCpu 2 `
       -VMHost host.your-domain.local

$vm = Get-VM zldnlinit10
$vm | New-HardDisk -CapacityGB 30 -Persistence persistent

$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.Firmware = [VMware.Vim.GuestOsDescriptorFirmwareType]::efi
$vm.ExtensionData.ReconfigVM($spec)

Start-VM -VM $vm

#Get-VM -Name $vm | 
#Start-VM | 
#Get-CDDrive| 
#Set-CDDrive -Connected $true -IsoPath '[Corporate_5] iso_files/LiteTouchPE_x64.iso' -StartConnected $true -confirm:$false
 
 





