function SendEmail($to, $body, $subject)
{
    $adminUserName="test@domain.com"
    $adminPassword="abc123"
    $smtpUrl = "smtp.domain.com"
    $port = 587

    $from = $adminUserName
    # $to = " "
    # $cc = " "
    # $bcc = " "
    # $attachments = " "
    # $body = " "
    # $subject = " "

    $msg = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)
    # $msg.CC.Add($cc)
    # $msg.Bcc.Add($bcc)
    # $msg.Attachments.Add($attachments)
    $msg.IsBodyHtml = $true

    $smtpClient = New-Object Net.Mail.SmtpClient($smtpUrl, $port)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential($adminUserName, $adminPassword)
    $smtpClient.Send($msg)
}


SendEmail -to "pasta0126@gmail.com" -body "Lorem <strong>Ipsum</strong> dolor sit amet."
