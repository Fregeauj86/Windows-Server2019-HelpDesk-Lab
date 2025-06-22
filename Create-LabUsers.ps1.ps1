$password = ConvertTo-SecureString "P@ssword123!" -AsPlainText -Force

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'LabUsers'")) {
    New-ADOrganizationalUnit -Name "LabUsers" -Path "DC=lab,DC=local"
}

Import-Csv .\users.csv | ForEach-Object {
    $userParams = @{
        Name               = $_.Name
        GivenName          = $_.Name.Split(" ")[0]
        Surname            = $_.Name.Split(" ")[1]
        SamAccountName     = $_.Username
        UserPrincipalName  = $_.Email
        EmailAddress       = $_.Email
        DisplayName        = $_.Name
        AccountPassword    = $password
        Enabled            = $true
        Path               = "OU=LabUsers,DC=lab,DC=local"
    }

    try {
        New-ADUser @userParams
        Write-Host "Created user: $($_.Username)" -ForegroundColor Green
    } catch {
        Write-Warning "Failed to create user $($_.Username): $_"
    }
}
