# https://wintech.sgal.info/2016/12/easy-way-to-determine-uefi-or-legacy.html

if (Test-Path $env:windir\Panther\setupact.log) {(Select-String 'Detected boot environment' -Path "$env:windir\Panther\setupact.log"  -AllMatches).line -replace '.*:\s+'} else {if (Test-Path HKLM:\System\CurrentControlSet\control\SecureBoot\State) {"UEFI"} else {"BIOS"}}


Get-WmiObject  -query 'Select * from Win32_DiskPartition Where Type = "GPT: System"' | select Name, Index, Bootable, BootPartition,PrimaryPartition, @{n="SizeInMB";e={$_.Size/1MB}}


# Get-CimInstance -ClassName Win32_ComputerSystem

# Get-CimInstance -ClassName Win32_BIOS

Get-EsxCli -VMHost * -Server 

(Get-EsxCli -VMHost supermicro01.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()
(Get-EsxCli -VMHost supermicro02.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()
(Get-EsxCli -VMHost supermicro03.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()
(Get-EsxCli -VMHost supermicro04.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()

(Get-EsxCli -VMHost bigtwin01.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()
(Get-EsxCli -VMHost bigtwin02.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()
(Get-EsxCli -VMHost bigtwin03.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()
(Get-EsxCli -VMHost bigtwin04.becrypt-hq.local -V2).Hardware.trustedboot.get.invoke()