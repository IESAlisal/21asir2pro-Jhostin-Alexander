cls
$diasAtras=read-host "¿Hace cuantos dias atras quieres comprobar?"
$text=read-host "Indique como desea llamar al log que se creara"
 $date1= (Get-Date).AddDays(-$diasAtras)
Get-ADUser -Properties LastLogonDate -Filter {LastLogonDate -le $date1} > C:\Users\Administrador\Desktop\PS1\$text.txt | fl 

