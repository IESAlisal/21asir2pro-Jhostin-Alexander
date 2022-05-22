cls

$usuarios=Read-host "Indique nombre de usuarios que desee crear"; ##usuarios que crearemos##
$cantidad=Read-Host "¿Cuantos usuarios quieres crear?"
$contraseña=Read-Host "Indica la contraseña predeterminada"
foreach($usuario in $usuarios){
$NuevaOU=read-host "Indica el nombre de la OU en donde quieres añadir el usuario"
   New-ADGroup -name $usuario -Path "OU=$NuevaOU,DC=Proyecto,DC=es" -GroupScope DomainLocal
    for($i=1;$i -le $cantidad;$i++){
    write-host $usuario$i
        $contra=ConvertTo-SecureString -string $contraseña -Asplaintext -Force
    New-ADUser -Name $usuario$i -AccountPassword $contra -Path "OU=$NuevaOU,DC=Proyecto,DC=es" -passthru -Enabled $true -ChangePasswordAtLogon $true
   Add-ADGroupMember -Identity $usuario -Members $usuario$i
   mkdir "C:\users\$usuario$i"
   New-SMBShare –Name $usuario$i –Path "C:\users\$usuario$i" –FullAccess Administrador -ReadAccess $usuario$i 
    }
}
