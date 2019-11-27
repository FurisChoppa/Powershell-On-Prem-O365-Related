$body = "<html xmlns=""http://www.w3.org/1999/xhtml%22%22%3E<head><meta http-equiv=""Content-Type"" content=""text/html""><title>UNLICENSED USERS</title></head>"
$body += "<body><table width=""100%"" align=""center"" cellpadding=""0"" cellspacing=""0"">"
$body += "                                <strong>Hello,<span style=""text-transform: capitalize"">glorious IT-admin!</span></strong></p>"
$body += "                            <p style=""font-weight: normal; color: #333; font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height:22px;"">New Title in AD is probably used, check licensing script.<br /></p>"
$body += "                            <br>"

Get-ADUser -SearchBase "OU=" -SearchScope OneLevel -Filter { Enabled -eq 'True' -and (SAMAccountName -notlike 'tmp*') } -Properties extensionAttribute3, title, memberof |



foreach {
    $.memberof

if($_.memberof -match "SEC_O365_E31") {
   ####Executes when the Boolean expression 1 is true
}elseif($.memberof -match "SEC_O365_E32") {
   ###Executes when the Boolean expression 2 is true
}elseif($.memberof -match "SEC_O365_F11") {
   ####Executes when the Boolean expression 3 is true
}elseif($.memberof -match "SEC_O365_F12") {
    ###Executes when the Boolean expression 4 is true
}elseif($.memberof -match "SEC_O365_A31") {
    ###Executes when the Boolean expression 5 is true
}elseif($.memberof -match "SEC_O365_A32") {
   ##Executes when the Boolean expression 6 is true
}else {

$body += Write-Output "USER '$($.samaccountname)' with TITLE '$($_.title)'is NOT a member of license groups<br>"
}}
$body += "</body>"
Send-MailMessage -to MailAdress@mail.com -from noreply@mailadress.com -subject "ATTENTION: Users Without o365-license" -SmtpServer mail.mail.com -BodyAsHtml -body $body -encoding unicode
