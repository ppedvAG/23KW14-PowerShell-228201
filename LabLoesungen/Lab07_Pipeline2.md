# Mögliche Lösung zu Lab: PipeLine 2

Hauptaufgabe
```powershell
 Get-Process -Name svchost | Measure-Object -Property PM -Sum
```
* Fleißaufgabe
```powershell
(Get-Process -Name svchost | Measure-Object -Property PM -Sum).Sum / 1MB
```
oder über Variablen
```powershell
$svcsum = Get-Process -Name svchost | Measure-Object -Property PM -Sum
$svcsum.Sum / 1MB
``` 
oder über Hashtable
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -Sum | Format-Table -Property @{n="Sum(MB)";e={$PSItem.Sum / 1MB}}
```

** Fleißaufgabe
```powershell
"{0:N2}" -f ((Get-Process -Name svchost | Measure-Object -Property PM -Sum).Sum / 1MB)
```

mit Hashtable
```powershell
PS C:\> Get-Process -Name svchost | Measure-Object -Property PM -Sum | Format-Table -Property @{n="Sum(MB)";e={"{0:N2}" -f ($PSItem.Sum / 1MB)}}
```
Alternativ kann man bei den Format Kommandos in der Hashtable auch die Eigenschaft Formatstring verwendet werden
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -Sum | Format-Table -Property @{n="Size(MB)";e={$PSItem.sum/1MB}; formatString="N2"}
```
oder
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -sum | Select-Object -Property @{n="Size(MB)";e={$PSItem.sum /1MB}}
```