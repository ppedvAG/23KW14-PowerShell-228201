<#
.SYNOPSIS 
Kurzbeschreibung: Abfrage von Events
.DESCRIPTION
Lange Beschreibung: Abfrage von Anmelde / User STatus bezogenen Events
.PARAMETER EventId
Dieser Parameter definiert welches Event abgefragt wird.
4624 | Anmeldung
4625 | fehlgeschlagene Anmeldung
4634 | Abmeldung
.EXAMPLE
Get-LogonEvents.ps1 -EventId 4624
  Index Time          EntryType   Source                 InstanceID Message
  ----- ----          ---------   ------                 ---------- -------
 478456 Apr 05 15:09  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
 478453 Apr 05 15:08  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
 478450 Apr 05 15:08  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
 478447 Apr 05 15:08  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
 478444 Apr 05 15:08  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId ,

[ValidateRange(1,10)]
[int]$Newest = 5 ,

[string]$Computername = "localhost"
)

$Newest = 15

Write-Verbose -Message "Optionale Ausgaben können mir gemacht werden"
Write-Verbose -Message "Das Skript wurde mit Eventid $EventID ausgeführt"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest


