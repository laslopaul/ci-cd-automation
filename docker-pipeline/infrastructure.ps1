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

$ClusterExists = Get-AzResource -Name $ClusterName -ResourceGroupName $RgName

if ($Mode -eq "create" -and $null -ne $ClusterExists) {
    Write-Host "Cluster '$ClusterName' already exists in resource group '$RgName'"
    Exit
}

elseif ($Mode -eq "create" -and $null -eq $ClusterExists) {
    New-AzResourceGroup -Name $RgName -Location $Location -ErrorAction Stop

    New-AzAksCluster `
        -ResourceGroupName $RgName -Name $ClusterName -NodeVmSize $NodeSize -NodeCount $NodeCount `
        -ErrorAction Stop
    
    Import-AzAksCredential -ResourceGroupName $RgName -Name $ClusterName -Force -ErrorAction Stop
}

elseif ($Mode -eq "destroy" -and $null -ne $ClusterExists) {
    Remove-AzResourceGroup -Name $RgName -Confirm -ErrorAction Stop
}