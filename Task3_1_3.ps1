# Вывести список из 10 процессов занимающих дольше всего процессор. Результат записывать в файл.

[CmdletBinding()]
Param 
(
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of directory for write:")]
  [string]$DirName,
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of file:")]
  [string]$FileName,
  
 [string]$FullDirName = $DirName + "\" + $FileName
)


Get-Process|Sort-Object CPU -Descending | Select-Object -First 10 |Out-File $FullDirName