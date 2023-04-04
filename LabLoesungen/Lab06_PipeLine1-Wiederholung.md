# Mögliche Lösung zu Lab: PipeLine 1 Wiederholung

### 1.
```powershell
Get-Process | Format-Table -Property ProcessName
```
```powershell
(Get-Process).ProcessName
```
---
### 2.
```powershell
Get-Process | Sort-Object -Property ProcessName
```
Da bereits als Tabelle Formatiert würde die obige Lösung reichen, wenn man es sich allerdings etwas hübscher machen will, könnte man Format-Table verwenden mit angepassten Spalten
```powershell
Get-Process | Sort-Object -Property ProcessName | Format-Table -Property ProcessName,PM
```
---
### 3.
```powershell
Get-Process -Name svchost | Measure-Object
```
---
### 4.
```powershell
 Get-Process | Sort-Object -Property PM | Select-Object -Last 3
```
Alternativ wenn man den mit dem höchsten Wert als erster Stelle stehen haben will kann man absteigend sortieren, und bei **Select-Object** anstelle von **-Last** **-First** verwenden
```powershell
Get-Process | Sort-Object -Property PM -Descending | Select-Object -First 3
```