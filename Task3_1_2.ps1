# Просуммировать все числовые значения переменных среды Windows. 

[CmdletBinding()]
Param 
(
  [Parameter(Mandatory = $True, HelpMessage = "Enter first initial value of sum:")]
  [int]$sum
)

foreach ($i in (Get-Variable | Select-Object Value)) 
         { if ($i.Value -is [int])
              { $sum += $i.Value }}; 
$sum