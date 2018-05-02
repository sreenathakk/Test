﻿
Param(
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $RdbrokerURI,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $TenantName,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $AadTenantId,

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string] $FriendlyName,

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string] $Description,
         
    [Parameter(Mandatory=$True)]
    [String] $Username,
    [Parameter(Mandatory=$True)]
    [SecureString] $Password

  
)




Invoke-WebRequest -Uri "https://raw.githubusercontent.com/sreenathakk/Test/master/PowershellModules.zip" -OutFile "C:\PowershellModules.zip"
Expand-Archive "C:\PowershellModules.zip" -DestinationPath C:\
Import-Module C:\PowershellModules\Microsoft.RDInfra.RDPowershell.dll
$SecurePass = $Password | ConvertTo-SecureString -asPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($Username,$SecurePass)
Set-RdsContext -DeploymentUrl $RdbrokerURI -Credential $Credential
$newRdsTenant=New-RdsTenant -Name $TenantName -AadTenantId $AadTenantId -FriendlyName $FriendlyName -Description $Description
#$newRDSHostPool=New-RdsHostPool -TenantName $tenName -Name $HostPoolName -Description $HostPoolDescription -FriendlyName $HostPoolFriendlyName

Remove-Item -Path "C:\PowershellModules.zip"
Remove-Item -Path "C:\PowershellModules" -Force
