Import-Module ActiveDirectory

$CSVFilePath = "C:\Users\sysadmin\Desktop\MyCSV.Csv"
$MyMailDomain = "@hq.sde.gf2"

$Users = Import-Csv $CSVFilePath

Foreach ($User in @Users) {
New-ADUser -Name ($User.Givename + "." + $User.Surname)
-SamAccountName $User.Samaccount
-UserPrincipalName ($User.SamAáccount + $MyMailDomain)
-Surname $User.Surname
-GivenName $User.Givenname
-Path $user.OU
-AccountPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force)
-ChangePasswordAtLogon $true
-Enabled $true

Add-ADGroupMember -Identity "Domain Users" -Members $User.Samaccount
Add-ADGroupMember - Identity "Remote Desktop Users" -Members $User.Samaccount

$HomeFolderPath = $User.HomeFolder
New-Item -ItemType Directory -Path $HomeFolderPath

Set-AdUser $User.Samaccount -HomeDrive "H:" -HomeDirectory $HomeFolderPath -ProfilePath $User.profilePath