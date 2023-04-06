[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[string]$Groupname
)

$Groupmember = Get-ADGroupMember -Identity $Groupname
foreach($User in $Groupmember)
{
  $Users =  Get-ADUser -Identity $PSItem.SamAccountName -Properties LastLogonTimestamp 
}

Format-Table -InputObject $User -Property Name,@{n="LastLogon";e={[datetime]::FromFileTime($PSItem.LastLogonTimestamp)}}

