##Jhostin Alexander Cadme Salinas##
#Creacion masiva de usuarios en unidades organizativas y sus
##respectivos grupos ##

cls

$usuarios=Read-host "Indique nombre de usuarios que desee crear"; ##usuarios que crearemos##
$cantidad=Read-host "Indique la cantidad de usuarios";
foreach($usuario in $usuarios){
        $UnidadO=Read-Host "¿Desea crear unidad organizativa nueva?(SI/NO)"
    if($UnidadO -eq "Si"){
        $NuevaOU=Read-host "Indique Nombre De La Nueva OU"
        Write-host "Se crearan los usuarios en la OU indicada"
        Write-host "La contraseña predeterminada debera cumplir requisitos de complejidad"
        $contraseña=Read-Host "Indique contraseña predeterminada de los usuarios"
        write-host "Se añadiran los usuarios a su grupo correspondiente."
        New-ADOrganizationalUnit -Name $NuevaOU -ProtectedFromAccidentalDeletion:$false
        New-ADGroup -name $usuario -Path "OU=$NuevaOU,DC=Proyecto,DC=es" -GroupScope DomainLocal
    for($i=1;$i -le $cantidad;$i++){

        $contra=ConvertTo-SecureString -string $contraseña -Asplaintext -Force 
        #Remove-ADUser -Identity $usuario$i -Confirm:$false
        New-ADUser -Name $usuario$i -AccountPassword $contra -Path "OU=$NuevaOU,DC=Proyecto,DC=es" -passthru -Enabled $true -ChangePasswordAtLogon $true

        Add-ADGroupMember -Identity $usuario -Members $usuario$i
        }
    }
    if($UnidadO -eq "No"){
        $UO=Read-host "Indique la Unidad Organizativa existente"
        Write-host "Se crearan los usuarios en la OU indicada"
        Write-host "La contraseña predeterminada debera cumplir requisitos de complejidad"
        $contraseña=Read-Host "Indique contraseña predeterminada de los usuarios"
        write-host "Se añadiran los usuarios a su grupo correspondiente."
        New-ADGroup -name $usuario -Path "OU=$UO,DC=Proyecto,DC=es" -GroupScope DomainLocal
    for($i=1;$i -le $cantidad;$i++){

        $contra=ConvertTo-SecureString -string $contraseña -Asplaintext -Force 
        #Remove-ADUser -Identity $usuario$i -Confirm:$false
        New-ADUser -Name $usuario$i -AccountPassword $contra -Path "OU=$UO,DC=Proyecto,DC=es" -passthru -Enabled $true -ChangePasswordAtLogon $true

        Add-ADGroupMember -Identity $usuario -Members $usuario$i
        }
    }
}









