Param(
    [Parameter(Mandatory)]
    [ValidateSet("create", "destroy")]
    $Mode,

    $RgName = "dockerjsapp", 
    $Location = "eastus",
    $ClusterName = "$(RgName)-cluster",
    $NodeSize = "Standard_B2s",
    $NodeCount = 1
)

$account = Import-AzContext -Path az-profile.json
$SubscriptionID = $account.Context.Subscription.SubscriptionId
Set-AzContext -SubscriptionId $SubscriptionID | Out-Null

if ($Mode -eq "create") {
    New-AzResourceGroup -Name $RgName -Location $Location

    New-AzAksCluster `
        -ResourceGroupName $RgName -Name $ClusterName -NodeVmType $NodeSize -NodeCount $NodeCount -GenerateSshKey
    
    Import-AzAksCredential -ResourceGroupName $RgName -Name $ClusterName
}

else {
    Remove-AzResourceGroup -Name $RgName -Force
}