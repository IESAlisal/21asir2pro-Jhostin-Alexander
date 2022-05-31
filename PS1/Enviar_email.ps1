$credencial = Get-Credential
Send-MailMessage -From 'jhostin.alexander98@gmail.com' -To 'jhostin.alexander98@gmail.com' -Subject 'Asunto del correo' -Body 'Cuerpo del correo' -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential $credencial
