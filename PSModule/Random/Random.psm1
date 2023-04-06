function Get-RNDColoreFileName
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
[string]$Path,

[switch]$Recurse
)

$File = Get-ChildItem -Path $Path -File -Recurse:$Recurse | Get-Random

$Color = Get-Random -Minimum 0 -Maximum 15

Write-Host -ForegroundColor $Color -Object $File.Name

}