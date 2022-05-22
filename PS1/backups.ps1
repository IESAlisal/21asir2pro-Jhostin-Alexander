cls
$equipo=Read-Host "Indique el equipo al que desea conectarse para hacer la copia"

if(Test-Connection -ComputerName $equipo -count 1 -Quiet ){
Invoke-Command -ComputerName $equipo -ScriptBlock{
$usuario=Read-Host "Indique el usuario que desea hacer copia de seguridad"
#Get-ChildItem -Path C:\users\$usuario
Copy-Item -Path C:\Users\$usuario\Documents -Destination c:\Backup -Recurse -force
}

}
