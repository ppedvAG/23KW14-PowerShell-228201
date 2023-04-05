#Abfragen über eine API Welche Feiertage es im Jahr 2023 im BundesLAnd NW gibt
$holidays = Invoke-RestMethod -Uri 'https://feiertage-api.de/api/?jahr=2023&nur_land=NW'

#prüfen ob Morgen ein Feiertag ist
([DateTime]$holidays.Ostermontag.datum ).ToShortDateString() -eq (Get-Date).AddDays(1).ToShortDateString()