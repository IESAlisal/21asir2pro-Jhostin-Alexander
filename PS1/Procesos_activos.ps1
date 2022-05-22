cls
$equipo=read-host "¿Que Equipo Desea Comprobar?"

    if(Test-Connection -ComputerName $equipo -Count 1 -Quiet ){
        write-host $equipo "Esta conectado"
        write-host "Se esta iniciando la conexion a" $equipo 
        Write-Host "Comprando procesos ejecutados"
      $comando=Invoke-Command -ComputerName $equipo -ScriptBlock{
        Get-Process 
        }
        $comando 
        $guardar=read-host "¿Desea guardar el resultado?"
        }
    
   if( $guardar -eq "Si"){
   $nombre=read-host "Indique el nombre del archivo"
$comando > C:\Users\Administrador\Desktop\PS1\$nombre.txt
   }
    
    