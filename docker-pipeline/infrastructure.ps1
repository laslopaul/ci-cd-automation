Param(
    [Parameter(Mandatory)]
    [ValidateSet("create", "destroy")]
    $Mode,

    $RgName = "dockerjsapp", 
    $Location = "eastus",
    $ClusterName = "dockerjsapp-cluster",
    $NodeSize = "Standard_B2s",
    $NodeCount = 1
)

if ($Mode -eq "create") {
    New-AzResourceGroup -Name $RgName -Location $Location

    New-AzAksCluster `
        -ResourceGroupName $RgName -Name $ClusterName -NodeVmSize $NodeSize -NodeCount $NodeCount -GenerateSshKey
    
    Import-AzAksCredential -ResourceGroupName $RgName -Name $ClusterName -Force
}

else {
    Remove-AzResourceGroup -Name $RgName -Force
}