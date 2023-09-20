# This is not production code. It is just an example!

# Prerequisites

- Install [PnP Powershell](https://pnp.github.io/powershell/) module
    - You will need to grant admin consent for the tenant. If you're not a global admin, get help from one on first run.
- Have a tenant admin account credential for use with this script.
- Know your site URL
    - Something like `https://YourOrgName.sharepoint.com/SiteName`

# PnP.Powershell

This script relies on the `Add-PnPFile` cmdlet. Read about it [here](https://pnp.github.io/powershell/cmdlets/Add-PnPFile.html).

## Usage

Clone this repo:
```bash
git clone https://github.com/subtlesanitynet/Send-FilesToSPO.git
```
Open `Send-FilesToSPO` in your preferred text editor or IDE.

You'll need to edit the variable on lines 23 and 24.

I've populated the `$Directories` variable as an example to demonstrate how easily you can use the function to move multiple directories into a single Sharepoint site and preserve folder structure.

I've added a dummy value for `$SiteURL`. You need to replace that with a valid Sharepoint site url.

Navigate to the cloned directory: `cd .\Send-FilesToSPO` in your shell.
You can then execute with `.\Send-FilesToSPO.ps1`.

Because you have already installed the `PnP.Powershell` module, you'll get a modal window for login to Sharepoint. Authenticate with an account that has admin access to the Sharepoint site you're uploading files to.

## Details

This function will recursively upload files from a Windows file system directory to a specified Sharepoint site and it will preserve your folder structure in Sharepoint.

I've also included components in there that preserves each file's last modified date metadata attribute value. You can also add more metadata info for the operation if you choose. The date item is a simple one to use for demonstratin purposes.

This script is an example only. It will not work unless you edit it. The intention is for you to gain familiarity with the `PnP.Powershell` module. You can use the function contained in the script freely in other scripts. Simplify it or enhance it to your liking. The sky is the limit.