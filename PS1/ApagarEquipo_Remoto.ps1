cls
cls
$equipo=read-host "¿Que Equipo Desea Apagar?"

    if(Test-Connection -ComputerName $equipo -Count 1 -Quiet ){
        write-host $equipo "Esta conectado"
        write-host "Se esta iniciando la conexion a" $equipo
        $comando=Invoke-Command -ComputerName $equipo -ScriptBlock{
        shutdown /s
        }
        $pregunta=read-host "¿Esta seguro que desea apagar el equipo?"
        if($pregunta -eq "Si"){
        $comando 
        write-host "El equipo se ha apagado correctamente"}
        else{
        write-host "El equipo seguira encendido"
        }
        
        
        }