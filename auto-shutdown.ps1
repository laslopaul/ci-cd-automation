# Enable auto shutdown for VMs in a resource group
Param (
    [Parameter(Mandatory)]$rgName
)

$account = Import-AzContext -Path az-profile.json
$subscriptionId = $account.Context.Subscription.SubscriptionId
Set-AzContext -SubscriptionId $subscriptionId | Out-Null

$vms = Get-AzVM -ResourceGroupName $rgName
if ($vms.Count -eq 0) {
    Write-Host -ForegroundColor Yellow "Resource group $rgName has no virtual machines"
    Exit
}

# Check auto-shutdown status and enable it
foreach ($vm in $vms) {
    Write-Host "`nChecking VM: $($vm.Name)..."
    $shutdownResId = "/subscriptions/$subscriptionId/resourceGroups/$rgName/providers/microsoft.devtestlab/schedules/shutdown-computevm-$($vm.Name)"
    $shutdownRes = Get-AzResource -ResourceId $shutdownResId -ErrorAction SilentlyContinue
    if ($shutdownRes.Properties.status -eq "Enabled") {
        Write-Host -ForegroundColor Blue "Auto-shutdown for $($vm.Name) has been already enabled"
        continue
    }

    # Add auto-shutdown properties
    Write-Host "Enabling auto-shutdown for $($vm.Name)..."
    $Properties = @{}
    $Properties.Add('status', 'Enabled')
    $Properties.Add('taskType', 'ComputeVmShutdownTask')
    $Properties.Add('dailyRecurrence', @{'time' = "2000" })
    $Properties.Add('timeZoneId', "Eastern Standard Time")
    $Properties.Add('targetResourceId', $vm.Id)

    New-AzResource `
        -ResourceId $shutdownResId -Location $vm.Location -Properties $Properties -Force | Out-Null
    Write-Host -ForegroundColor Green "Auto-shutdown was successfully enabled for $($vm.Name)"
}