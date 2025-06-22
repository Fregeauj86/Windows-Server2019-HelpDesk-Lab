Get-ADUser -Filter * -SearchBase "OU=LabUsers,DC=lab,DC=local" -Properties SamAccountName,EmailAddress,Enabled |
    Select-Object Name,SamAccountName,EmailAddress,Enabled |
    Export-Csv .\LabUsers-Export.csv -NoTypeInformation

Write-Host "Exported users to LabUsers-Export.csv"
