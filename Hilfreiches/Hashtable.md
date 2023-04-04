# Beispiel für die Verwendung einer Hashtable

```powershell
Get-Volume | Select-Object -Property DriveLetter,@{n="Size(GB)";e={$PSItem.Size /1GB}},@{n="Remaining(GB)";e={$PSItem.SizeRemaining / 1GB}},@{n="Allocated(GB)";e={($PSItem.Size - $PSItem.SizeRemaining) / 1GB}}
```
Ausgabe:
```
DriveLetter          Size(GB)         Remaining     Allocated(GB)
-----------          --------         ---------     -------------
            0,888668060302734 0,121742248535156 0,766925811767578
C             1906,5693321228  862,251914978027  1044,31741714478
``` 