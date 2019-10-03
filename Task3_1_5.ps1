#	Создать один скрипт, объединив 3 задачи:

[CmdletBinding()]
Param 
(
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of directory for write:")]
  [string]$DirName,
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of file:")]
  [string]$FileName,
  [Parameter(Mandatory = $True, HelpMessage = "Enter name of the secondary directory for write:")]
  [string]$SecDirName,
  [Parameter(Mandatory = $True, HelpMessage = "Enter second name of file:")]
  [string]$SecFileName,
  [Parameter(Mandatory = $True, HelpMessage = "Enter directory name:")]
  [string]$FindDirName,
  
 [string]$FullDirName = $DirName + "\" + $FileName,
 [string]$FullSecondDirName = $SecDirName + "\" + $SecFileName
)

#1.	Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
foreach ($i in Get-HotFix | Select-Object Description, HotFixID, InstalledBy, InstalledOn, PSComputerName)
{
    if ($i.Description -eq "Security Update")
    {
       $i| Export-Csv -Path $FullDirName  -Append
    }
}

#2.	Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.

Get-ChildItem $FindDirName | Export-Clixml  -path $FullSecondDirName

#3.	Загрузить данные из полученного в п.1.5.1 или п.1.5.2 файла и вывести в виде списка  разным разными цветами


 #Get-Content "C:\M2T2_Britikova\Info_about_commands1.csv"| Select  *


Get-Content $FullSecoDirName | Select  * | Write-Host -f blue

Get-Content $FullDirName| Select  * | write-host -f red
