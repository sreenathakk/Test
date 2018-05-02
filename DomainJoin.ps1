Param(
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $addomain,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $DomainAdmin,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [securestring] $DomainPassword
)

$Domainusername = "$addomain\$DomainAdmin" 
$credential = New-Object System.Management.Automation.PSCredential($Domainusername,$DomainPassword)
Add-Computer -DomainName $addomain -Credential $credential