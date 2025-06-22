# Windows Server 2019 Help Desk Lab (John Fregeau)

This is a custom Active Directory lab I built and scripted on a Windows Server 2019 virtual machine to simulate common IT Help Desk tasks. It’s meant to demonstrate real-world skills like user provisioning, group management, and PowerShell automation.

## What This Lab Does

- Creates an Organizational Unit (OU) for lab users
- Adds users to Active Directory from a `.csv` file
- Assigns all users to a security group called `HelpDeskUsers`
- Exports the user list back into a `.csv` file for documentation or auditing

Everything is built using PowerShell. You can test and reuse it in your own Server 2019 lab or VM.

## Files Included

| File                     | Purpose                                      |
|--------------------------|----------------------------------------------|
| `users.csv`              | User data (Name, Username, Email)            |
| `Create-LabUsers.ps1`    | Creates OU and AD users from the CSV         |
| `Add-LabUsersToGroup.ps1`| Adds users to the `HelpDeskUsers` group      |
| `Export-LabUsers.ps1`    | Exports user list to CSV                     |
| `README.md`              | You’re reading it ??                         |

## How to Use

Ensure you're running on a domain controller (Windows Server 2019) with AD PowerShell tools installed.

1. Open PowerShell **as Administrator**
2. Place all files in the same folder
3. Run the scripts in this order:

```powershell
.\Create-LabUsers.ps1
.\Add-LabUsersToGroup.ps1
.\Export-LabUsers.ps1
