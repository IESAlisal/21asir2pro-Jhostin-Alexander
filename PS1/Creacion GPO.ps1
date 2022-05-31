#Import-Module grouppolicy
Get-Command -Module grouppolicy
new-gpo -Name TestGPO -Comment "Esto es una prueba para el proyecto" -Domain Proyecto.es
#Remove-GPO -Name TestGPO
