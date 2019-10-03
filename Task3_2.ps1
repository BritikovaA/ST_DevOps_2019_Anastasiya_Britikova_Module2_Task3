#2.	Работа с профилем
#     1.	Создать профиль

New-Item -ItemType File -Path $profile -force

#все остальное ниже закидываем в созданный текстовый файл
#     2.	В профиле изненить цвета в консоли PowerShell

(Get-Host).UI.RawUI.ForegroundColor = "red"
(Get-Host).UI.RawUI.BackgroundColor = "green"


#     3.	Создать несколько собственный алиасов

Set-Alias HelpMePls Get-Help
Set-Alias Command Get-Command
Set-Alias MyAlias Get-Alias

#     4.	Создать несколько констант

Set-Variable pii -Option Constant -Value 3.14
Set-Variable eee -Option Constant -Value 2.71


#     5.	Изменить текущую папку

Set-Location c:\

#     6.	Вывести приветсвие

Write-Host "Hello! How are you?"

#     7.	Проверить применение профиля

Write-Host ("This is pi: $pii")

Write-Host ("This is e: $eee")

Write-Host ("This is HelpMePls:")
HelpMePls
