$a = "<style>"
$a = $a + "BODY{background-color:peachpuff;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:purple}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:PaleGoldenrod}"
$a = $a + "</style>"

$html = Get-Service | Select-Object -Property Status,Name,Displayname | ConvertTo-Html -Head $a -Body "<h2>Dienst Info</h2>"

Send-MailMessage -From sender@domain.tld -To empfänger@domain.tld -Subject "Betreff" -SmtpServer smtp.domain.tld -Credential "netbios\samaccount" -BodyAsHtml -Body $html