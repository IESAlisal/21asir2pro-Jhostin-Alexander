##Jhostin Alexander Cadme Salinas##
#Creacion masiva de usuarios en unidades organizatias y sus
##respectivos grupos ##

cls
$usuarios="Inbound","Outbound"; ##usuarios que crearemos##
foreach($usuario in $usuarios){
for($i=1;$i -le 100;$i++){
#New-ADOrganizationalUnit -Name "Agentes" ## Unidad Organizativa##
#write-host $usuario $i
$contra=ConvertTo-SecureString -string "Hola1***" -Asplaintext -Force 
#Remove-ADUser -Identity $usuario$i -Confirm:$false
New-ADUser -Name $usuario$i -AccountPassword $contra -Path "OU=Agentes,DC=Proyecto,DC=es" -passthru -Enabled $true -ChangePasswordAtLogon $true
#Remove-adgroup -Identity $usuario -Confirm:$false
New-ADGroup -Name $usuario -GroupScope DomainLocal -Path "OU=Agentes,DC=Proyecto,DC=es"
Add-ADGroupMember -identity $usuario -Members $usuario$i


}
}

