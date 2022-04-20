cls
$usuarios="Inbound","Outbound";
foreach($usuario in $usuarios){
for($i=1;$i -le 10;$i++){
#New-ADOrganizationalUnit -Name "Agentes" 
#write-host $usuario $i
$contra=ConvertTo-SecureString -string "Hola1***" -Asplaintext -Force 
#Remove-ADUser -Identity $usuario$i 
New-ADUser -Name $usuario$i -AccountPassword $contra -Path "OU=Agentes,DC=Proyecto,DC=es" -passthru -Enabled $true -ChangePasswordAtLogon $true
}
}
