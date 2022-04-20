cls
if(Test-Connection -ComputerName usuario -Count 1 -Quiet){
Invoke-Command -ComputerName usuario -ScriptBlock{

stop-Process -name notepad -Force | where-object {$_.ProcessName -eq "notepad"} 


}}