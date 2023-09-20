Function Send-FoldertoSpo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][String]$Path,
        [Parameter(Mandatory)][String]$SiteUrl
    )
    Connect-PnPOnline -Url $SiteURL -DeviceLogin
    $TargetFolder = "Shared Documents/General"
    $Files = Get-ChildItem -Recurse -Path $Path -File -Name
    Try {
        $Files | % {
            $Parent = Split-Path $_
            # $DestinationFile = Split-Path $_ -Leaf
            $LastWrite = (Get-Item "$Path\$_").LastWriteTime
            $Modified = Get-Date $LastWrite -Format M/d/yyyy
            Add-PnPFile -Path "$Path\$_" -Folder "$TargetFolder/$Parent" -Values @{Modified="$Modified"}
        }
    } Catch {
        Write-Error $Error[0]
    }
}

$Directories = @("\\10.0.90.43\Operations\Reporting","\\10.0.90.43\Operations\Incidents","\\10.0.90.43\Operations\IT","\\10.0.90.43\Operations\Emails")
$SiteURL = "https://company.sharepoint.com/SiteName"

$Directories | % {
    Send-FoldertoSpo -Path $_ -SiteUrl $SiteURL
}
