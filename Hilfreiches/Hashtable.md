# Beispiel für die Verwendung einer Hashtable

```powershell
Get-Volume | Select-Object -Property DriveLetter,@{n="Size(GB)";e={$PSItem.Size /1GB}},@{n="Remaining(GB)";e={$PSItem.SizeRemaining / 1GB}},@{n="Allocated(GB)";e={($PSItem.Size - $PSItem.SizeRemaining) / 1GB}}
```