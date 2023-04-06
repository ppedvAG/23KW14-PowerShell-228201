function Get-Time
{
[cmdletBinding()]
param(

)

(Get-Date).ToShortTimeString()

}