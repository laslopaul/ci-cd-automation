# List resources of a subscription into CSV file
Param( 
    [Parameter(Mandatory)]$Outfile, 
    $RmNoTags = $false
)

$account = Import-AzContext -Path az-profile.json
$SubscriptionID = $account.Context.Subscription.SubscriptionId
Set-AzContext -SubscriptionId $SubscriptionID | Out-Null

Write-Host "Listing resource groups:"
$rgs = Get-AzResourceGroup
foreach ($rg in $rgs.ResourceGroupName) {
    Write-Host "$rg"
}
$group = Read-Host -Prompt "`nPlease enter a resource group name"

# Delete resources without tags
if ($RmNoTags -eq $true) {
    $res = Get-AzResource `
        -ResourceGroupName $group | Where-Object { $null -eq $_.Tags -or $_.Tags.Count -eq 0 }
    foreach ($res_id in $res.ResourceId) {
        Remove-AzResource -Force -ResourceId $res_id
    }
}

# Output contents to CSV file 
Get-AzResource `
    -ResourceGroupName $group | `
    Select-Object ResourceGroupName, Name, ResourceType, Tags | `
    Export-Csv $Outfile -Force -NoTypeInformation
