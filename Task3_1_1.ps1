# Сохранить в текстовый файл на диске список запущенных(!) служб. 
#Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.

[CmdletBinding()]
Param 
(
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of directory for write:")]
  [string]$DirName,
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of file:")]
  [string]$FileName,
  
 [string]$FullDirName = $DirName + "\" + $FileName
)

Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File $FullDirName;
Get-ChildItem $DirName;
Get-Content $FullDirName;