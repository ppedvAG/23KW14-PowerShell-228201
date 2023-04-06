function New-TestFiles
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[string]$Path,

[ValidateRange(1,100)]
[int]$FileCount = 9,

[ValidateLength(3,15)]
[string]$BaseName = "Datei"
)

for($i = 1; $i -le $FileCount; $i++)
{
    $Filenumber = "{0:D3}" -f $i
    $FileName = "$BaseName$Filenumber.txt"
    New-Item -Path $Path -Name $FileName -ItemType File
}

}

function New-TestFilesDir
{
[cmdletBinding()]
param(

[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[string]$Path, 

[ValidateRange(1,100)]
[int]$DirCount = 3,

[ValidateRange(1,100)]
[int]$FileCount = 9,

[ValidateLength(3,15)]
[string]$Name = "TestFiles",

[switch]$Force
)

if($Path.EndsWith("\") -ne $true)
{
    $Path += "\"
}

if(Test-Path -Path ($Path + $Name) -PathType Container)
{
    if($Force)
    {
        Remove-Item -Path ($Path + $Name) -Recurse -Force
    }
    else
    {
        Write-Host -ForegroundColor Red -Object "Ordner bereits vorhanden"
        exit
    }
}


$TestFileDir = New-Item -Path $Path -Name $Name -ItemType Directory

#Dateien im Root Verzeichnis
<# Ersetzt durch Funktion 
for($i = 1; $i -le $FileCount; $i++)
{
    $Filenumber = "{0:D3}" -f $i
    $FileName = "File$Filenumber.txt"
    New-Item -Path $TestFileDir.FullName -Name $FileName -ItemType File
}
#>
New-TestFiles -Path $TestFileDir.FullName -FileCount $FileCount

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = "{0:D3}" -f $i
    $DirName = "Directory$DirNumber"
    $subdir = New-Item -Path $TestFileDir.FullName -Name $DirName -ItemType Directory

    Write-Debug -Message "Schleife - vor Dateierstellung in Ordnererstellung"

    <#
    for($j = 1; $j -le $FileCount; $j ++)
    {        
        $Filenumber = "{0:D3}" -f $j
        $FileName = "Dir$($Dirnumber)_File$Filenumber.txt"
        New-Item -Path $subdir.FullName -Name $FileName -ItemType File
    }#>
    New-TestFiles -Path $subdir.FullName -FileCount $FileCount -BaseName "Dir$($DirNumber)_Datei"
}
}