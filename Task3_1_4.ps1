#Подсчитать размер занимаемый файлами в папке (например C:\windows) за исключением файлов с заданным расширением(напрмер .tmp)

[CmdletBinding()]
Param 
(
  [Parameter(Mandatory = $True, HelpMessage = "Enter the directory:")]
  [string]$DirName
)
$sum = 0;
foreach($i in  (Get-ChildItem $DirName -Exclude "*.tmp" -Recurse  -ErrorAction Ignore))
{$sum = $sum+[int]$i.Length/1MB}
Write-Host ($sum)