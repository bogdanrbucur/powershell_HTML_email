### Create a new mailmessage ###

$msg = new-object net.mail.mailmessage
$msg.From = 'pal-crewing@asm-maritime.com'
$msg.To.Add('bogdanb-it@asm-maritime.com')
# $msg.CC.Add('ccemail');
$msg.Subject = 'Happy Birthday! ' + $(get-date -format dd/MM/yyyy)
$msg.IsBodyHtml = $true


#### Attach images with individual Content IDs (ContentId is used to refer to attachement inline in the email HTML body) ###


$attachment = New-Object System.Net.Mail.Attachment -ArgumentList "C:\Users\bogdanb\downloads\ASM.jpg"
$attachment.ContentDisposition.Inline = $true
$attachment.ContentId = 'ASM.jpg' #can be anything as long as it matches the CID reference in the HTML
$attachment.ContentDisposition.DispositionType = "Inline"
$attachment.ContentType.MediaType = "image/jpg"
$msg.Attachments.Add($attachment)


#repeat the above to add another attachment.


### Create the html body of the email ###

$msg.Body = "<img src='cid:ASM.jpg' />"


### Create connection to smtp server and send the mail ###

$smtp = New-Object Net.Mail.SmtpClient("192.168.222.227")
$smtp.Send($msg)
#$attachment.Dispose()
#$msg.Dispose()