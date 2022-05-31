#Get-Command -Module ScheduledTasks
cls
$action= New-ScheduledTaskaction -Execute "Powershell.exe" -Argument "C:\users\Administrador\Desktop\PS1\Usuarios_Conectados_N_Dias.ps1"
$trigger= New-ScheduledTaskTrigger -Once -At 20:16PM
$Settings = New-ScheduledTaskSettingsSet
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "Powershell" -TaskName "Usuarios_conectados" 
#Unregister-ScheduledTask -TaskName Usuarios_conectados