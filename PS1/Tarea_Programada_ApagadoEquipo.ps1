#Get-Command -Module ScheduledTasks
cls
$action= New-ScheduledTaskaction -Execute "Powershell.exe" -Argument "C:\users\Administrador\Desktop\PS1\ApagarEquipo_Remoto.ps1"
$trigger= New-ScheduledTaskTrigger -Once -At 21:50PM
$Settings = New-ScheduledTaskSettingsSet
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "Powershell" -TaskName "Apagado_equipo" 
#Unregister-ScheduledTask -TaskName Apagodo_equipo