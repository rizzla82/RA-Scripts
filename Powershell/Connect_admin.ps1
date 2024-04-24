# Office365
Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.3
Import-Module ExchangeOnlineManagement


# Get-InstalledModule
# Get-Module

# Add-PSSnapIn -Name Microsoft.Exchange, Microsoft.Windows.AD
# Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn;

# Get-ExecutionPolicy

$UserCredential = Get-Credential internal-domain.comraadm

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://ldnwinexch02.internal-domain.com/PowerShell/ -Authentication Kerberos -Credential $UserCredential

Import-PSSession $Session -DisableNameChecking

# Remove-PSSession $Session


Get-MailboxDatabase | Format-Table Name, Server, OfflineAddressBook -Auto

Get-ExchangeServer -ProxyToServer

Get-Mailbox -Server ldnwinexch01

Get-Mailbox -Server ldnwinexch02

Get-ExchangeServer | Where {($_.AdminDisplayVersion -Like “Version 14*”) -And ($_.ServerRole -Like “*ClientAccess*”)}

Get-MailboxDatabase | Where {$_.AdminDisplayVersion -Like “*15.1*”} | Format-Table Name, ServerName

Get-Mailbox -Arbitration | FL Name, Database, ServerName, AdminDisplayVersion

Get-CalendarDiagnosticAnalysis

Get-CalendarDiagnosticLog -Identity rafzal@your-domain.com

Get-Content C:\inetpub\logs\LogFiles\W3SVC1\u_ex201214.log -Tail 50 -Wait

Get-WebServicesVirtualDirectory | FL Name,Server,externalURL

Resolve-DnsName hybrid.your-domain.com

https://ldnwinexch02.internal-domain.com/mapi

https://ldnwinexch02.internal-domain.com/owa

https://ldnwinexch02.internal-domain.com/ecp

https://ldnwinexch02.internal-domain.com/Microsoft-Server-ActiveSync

https://ldnwinexch02.internal-domain.com/EWS/Exchange.asmx

https://ldnwinexch02.internal-domain.com/OAB

http://ldnwinexch02.internal-domain.com/powershell

# Get-MailboxFolderPermission -Identity john@contoso.com:\Calendar -User Ayla@contoso.com

Get-MailboxFolderPermission -Identity MW@your-domain.com:\Calendar  -User SB

Get-MailboxFolderPermission -Identity SB@your-domain.com:\Calendar

Get-MailboxFolderPermission -Identity vl@your-domain.com:\Calendar -User SB

Get-MailboxFolderPermission -Identity htyour-domain.com:\Calendar -User SB@your-domain.com

#Set-MailboxFolderPermission -Identity ayla@contoso.com:\Calendar -User ed@contoso.com -AccessRights Editor -SharingPermissionFlags Delegate -SendNotificationToUser $true

Set-MailboxFolderPermission -Identity  ht@your-domain.com:\Calendar -internal-domain.com SB -AccessRights Reviewer -SharingPermissionFlags Delegate -SendNotificationToUser $true

Set-MailboxFolderPermission -Identity  ht@your-domain.com:\Calendar -User SB@your-domain.com -AccessRights Reviewer -SharingPermissionFlags Delegate -SendNotificationToUser $false

#Add-MailboxFolderPermission -Identity ayla@contoso.com:\Calendar -User julia@contoso.com -AccessRights Editor -SharingPermissionFlags Delegate

Add-MailboxFolderPermission -Identity htoke@your-domain.com:\Calendar -UserSB@your-domain.com -AccessRights Reviewer -SharingPermissionFlags Delegate

Add-MailboxFolderPermission -Identity MWilce@your-domain.com:\Calendar -UserSB@your-domain.com -AccessRights Reviewer -SharingPermissionFlags Delegate

Set-MailboxFolderPermission -Identity MWilce@your-domain.com:\Calendar -AccessRights Reviewer -User Default


Add-MailboxFolderPermission -Identity ht@your-domain.com:\Calendar -User GP@your-domain.com -AccessRights Reviewer -SharingPermissionFlags Delegate -SendNotificationToUser $false

Get-MailboxPermission -Identity Artillery | Out-GridView

Get-MailboxPermission -Identity Shaftesbury | Out-GridView


#Get-MailboxFolderPermission -Identity GP@your-domain.com:\Calendar

Get-Mailbox -Identity VM@your-domain.com | fl


### Checking Settings:

Resolve-DnsName hybrid.your-domain.com

# Configuring the AutoDiscover SCP
# Get-ClientAccessServer | Select Name,AutoDiscoverServiceInternalURI

Get-ClientAccessService | Select Name,AutoDiscoverServiceInternalURI

Before:
LDNWINEXCH01 https://ldnwinexch01.internal-domain.com/autodiscover/autodiscover.xml
LDNWINEXCH02 https://ldnwinexch02.internal-domain.com/Autodiscover/Autodiscover.xml

After:
Get-ClientAccessServer | Set-ClientAccessServer -AutoDiscoverServiceInternalUri https://hybrid.your-domain.com/Autodiscover/Autodiscover.xml

New Command:
Get-ClientAccessService



# Configuring the Offline Address Book
Get-OabVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

# Configuring Exchange Web Services
Get-WebServicesVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

# Configuring Exchange ActiveSync
Get-ActiveSyncVirtualDirectory | select server,externalurl,internalurl | fl

# Configuring the Exchange Control Panel
Get-EcpVirtualDirectory | fl
Get-EcpVirtualDirectory

Before:
# Name                   Server      
# ----                   ------      
ecp (Default Web Site) LDNWINEXCH01
ecp (Default Web Site) LDNWINEXCH02

After:
Get-EcpVirtualDirectory | Set-EcpVirtualDirectory -ExternalUrl https://hybrid.your-domain.com/ecp -InternalUrl https://hybrid.your-domain.com/ecp

# Configuring Outlook Web App
Get-OwaVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

# Configuring MAPI
Get-MapiVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

# Configuring Outlook Anywhere
Get-OutlookAnywhere | Select Server,ExternalHostname,Internalhostname

Before:
Server       ExternalHostname InternalHostname             
------       ---------------- ----------------             
LDNWINEXCH02                  ldnwinexch02.internal-domain.com


After:

Get-OutlookAnywhere | Set-OutlookAnywhere -ExternalHostname hybrid.your-domain.com -InternalHostname hybrid.your-domain.com -ExternalClientsRequireSsl $true -InternalClientsRequireSsl $true -DefaultAuthenticationMethod NTLM

Get-ReceiveConnector –Identity “relay2021”

Get-ReceiveConnector -Server ldnwinexch01

Get-ReceiveConnector -Identity "Relay (Relay)"

Resolve-DnsName hybrid.your-domain.com
nslookup 192.168.70.38    LDNLIN1604DOPS
nslookup 192.168.20.140	  EMC 1
nslookup 192.168.170.5	  Soc HuntsMan
nslookup 10.10.30.1	      ??? HitMan
nslookup 192.168.20.47    LDNWINWEB02.internal-domain.com
nslookup 192.168.20.32    ldnlin1604web02.internal-domain.com
nslookup 192.168.20.14	  LDNWINWEB01
nslookup 192.168.20.210	  ldnlinapp01.internal-domain.com
nslookup 192.168.20.33	  LDNWINWSUS.internal-domain.com
nslookup 192.168.20.208	  Gemmi
nslookup 192.168.70.236	  android buildserver
nslookup 192.168.70.20	  LDNWIN19BLDCTR1
nslookup 192.168.70.19	  LDNLINPGSQL01.internal-domain.com
nslookup 192.168.70.18    ldnlinazure01
nslookup 192.168.70.17	  new EWS server
nslookup 192.168.70.16	  buildserverrel_32
nslookup 192.168.70.12	  ??
nslookup 192.168.20.25	  LDNWINPVS.internal-domain.com

#Shared Maibox:

Get-Mailbox -Identity <MailboxIdentity> | Format-List Name,RecipientTypeDetails,UserPrincipalName,AccountDisabled
Get-Mailbox -Identity soc | Format-List Name,RecipientTypeDetails,UserPrincipalName,AccountDisabled

Set-Mailbox -Identity "SOC" -Type shared

Get-InboxRule -Mailbox rafzal@your-domain.com

Get-inboxrule -Mailbox Devops.Feedback@your-domain.com

Get-inboxrule -Mailbox OUK@your-domain.com

#Get-Mailbox -ResultSize unlimited | Get-MailboxAutoReplyConfiguration

Get-MailboxAutoReplyConfiguration -Identity 'OUK@your-domain.com'ex

Get-ReceiveConnector "relay2021" | select -expand RemoteIPRanges

Get-ExchangeCertificate -Thumbprint BF6D9D576152F4282166ED5F050DF793C751F6CE | fl

#old Cert
Get-ExchangeCertificate -Thumbprint 19E85BB562BA7524A5F7DA4BE8CB59BE8060ACEC | fl

Get-ExchangeCertificate | Select-Object thumbprint, subject, NotAfter, services

Get-SendConnector -Identity "Outbound to Office 365" | fl


$tlscert=Get-ExchangeCertificate -Thumbprint 1C9A6BFF4A86723DD2667E77C1CC7B318E0A3141
$tlscertname = (‘<I>’+$tlscert.issuer+'<S>’+$tlscert.subject)
Set-SendConnector -Identity "Outbound to Office 365" -TLSCertificateName $tlscertname

Set-ReceiveConnector "LDNWINEXCH02\Default Frontend LDNWINEXCH02" -TlsCertificateName $tlscertname



Restart-Service MSExchangeTransport

Remove-ExchangeCertificate -Thumbprint 19E85BB562BA7524A5F7DA4BE8CB59BE8060ACEC 

Remove-ExchangeCertificate -Thumbprint A43319B98F71C92F17B1DE3EEB0BE8AD30519D30


Get-ExchangeCertificate -Thumbprint 19E85BB562BA7524A5F7DA4BE8CB59BE8060ACEC

Get-ExchangeCertificate -Thumbprint A43319B98F71C92F17B1DE3EEB0BE8AD30519D30

Enable-ExchangeCertificate -Thumbprint BF6D9D576152F4282166ED5F050DF793C751F6CE

Enable-ExchangeCertificate -Thumbprint A43319B98F71C92F17B1DE3EEB0BE8AD30519D30 -Services SMTP,IMAP,POP,IIS



Get-SendConnector -Identity "Outbound to Office 365" | fl


Enable-ExchangeCertificate -Thumbprint 1C9A6BFF4A86723DD2667E77C1CC7B318E0A3141  -Services IMAP,POP,IIS,SMTP


Disable-ExchangeCertificate –Thumbprint 19E85BB562BA7524A5F7DA4BE8CB59BE8060ACEC –Service SMTP

Disable-ExchangeCertificate –Thumbprint A43319B98F71C92F17B1DE3EEB0BE8AD30519D30 –Service IMAP,POP,IIS,SMTP

Remove-ExchangeCertificate –Thumbprint A43319B98F71C92F17B1DE3EEB0BE8AD30519D30 -Services IMAP,POP,IIS,SMTP



1C9A6BFF4A86723DD2667E77C1CC7B318E0A3141


BF6D9D576152F4282166ED5F050DF793C751F6CE

Get-Command *-ExchangeCertificate



Get-ExchangeCertificate | fl

Get-ExchangeCertificate | Out-GridView

Disable-ExchangeCertificate –Thumbprint xxxxxx –Service SMTP 

Disable-ExchangeCertificate –Thumbprint xxxxxx –Service SMTP

Invoke-RestMethod -Uri ('http://ipinfo.io/'+(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content)

Get-PublicFolderDatabase -Server ldnwinexch02

Get-MailboxDatabase | Format-Table Name, Server, OfflineAddressBook -Auto


Get-Mailbox -Arbitration | FL Name, Database, ServerName, AdminDisplayVersion

Get-Mailbox -Arbitration -Server ldnwinexch01 | FL Name, Database, ServerName, AdminDisplayVersion

Get-ExchangeServer | Where {($_.AdminDisplayVersion -Like “Version 15.1*”) -And ($_.ServerRole -Like “*Mailbox*”)} | Get-
ClientAccessService | Format-Table Name,AutoDiscoverServiceInternalUri -Auto

Get-Service | ?{$_.Status -like 'Running'}

Get-DatabaseAvailabilityGroup



Get-ExchangeServerAccessLicense

Get-ExchangeServerAccessLicenseUser -LicenseName “Exchange Server 2016 Standard CAL" | Out-GridView


Get-ExchangeServerAccessLicenseUser -LicenseName “Exchange Server 2016 Standard CAL" | Measure-Object | Select Count


# Safe for 2022-2023
Get-ExchangeCertificate | Select-Object thumbprint, subject, NotAfter, services

Thumbprint                               Subject                                            NotAfter            services
----------                               -------                                            --------            --------
A43319B98F71C92F17B1DE3EEB0BE8AD30519D30 CN=hybrid.your-domain.com                              09/01/2023 14:29:01         
BF6D9D576152F4282166ED5F050DF793C751F6CE CN=hybrid.your-domain.com, OU=Domain Control Validated 09/01/2022 11:55:36         
ADA1517F111CC1C1BB6113375338395C3612E399 CN=Federation                                      06/02/2024 14:49:04         
94B0150D274B54EBA655EC397927647B97406256 CN=Microsoft Exchange Server Auth Certificate      05/01/2024 17:08:57         
0A531A8F18FD4DBD23DFC3F4C4B8AB44C61A2BF9 CN=LDNWINEXCH02                                    31/01/2024 17:07:12         
560C760E62C5DE0391BBCBE99096D0F2B2BE5683 CN=WMSvc-SHA2-LDNWINEXCH02                         28/01/2029 15:09:06 


Cert Location
\\localhost\Tools\cert\2022-2024\renew.csr

\\localhost\Tools\cert\2022-2023\hybrid.your-domain.com\3c266a71e15707a2.crt

\\localhost\Tools\cert\2023-2024\hybrid.your-domain.com\4abf55a91f06f376.pem

\\localhost\Tools\cert\2023-2024\4abf55a91f06f376.crt


Get-ExchangeCertificate | fl FriendlyName, Subject, CertificateDomains, Services, Issuer, *not*, Status


# https://martinsblog.dk/exchange-replacing-certificate-for-microsoft-365-hybrid-connectors/

# https://www.alitajran.com/renew-certificate-exchange-hybrid/



#------------------

vssadmin list shadowstorage

vssadmin resize shadowstorage /on=c: /for=c: /maxsize=2GB

vssadmin resize shadowstorage /on=e: /for=e: /maxsize=6GB

http://woshub.com/how-to-clean-up-system-volume-information-folder/


#--------------


