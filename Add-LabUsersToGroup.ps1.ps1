if (-not (Get-ADGroup -Filter { Name -eq "HelpDeskUsers" })) {
    New-ADGroup -Name "HelpDeskUsers" -GroupScope Global -GroupCategory Security -Path "OU=LabUsers,DC=lab,DC=local"
    Write-Host "Created group HelpDeskUsers"
}

Get-ADUser -Filter * -SearchBase "OU=LabUsers,DC=lab,DC=local" | ForEach-Object {
    Add-ADGroupMember -Identity "HelpDeskUsers" -Members $_
    Write-Host "Added $($_.SamAccountName) to HelpDeskUsers"
}
