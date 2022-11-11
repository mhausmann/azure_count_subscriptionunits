$total_count = 0
$sub_count = 0
$hashTable = @{}

# Get Azure Subscriptions ID's
$GroupList = az account list --query '[].id'

# Loop for each Azure Subscription ID
foreach ($id in $GroupList) {
    $sub_count = 0
    if ($id.length -gt 4) {
        $Id_Comp = $id.substring(2,37).Trim('"', " ")
        az account set --subscription $Id_Comp
        echo "Current subscription is " $Id_Comp
        # use for loop to read all values and ID
        $vm=$(az resource list --resource-type "Microsoft.Compute/virtualmachines" --query "[?contains(id,'$Id_Comp')]" --output table | wc -l)
        if ($vm -gt 1) {
            # Server resources are counted at 1:1 SU
            $vm = $vm - 2
            echo "VirtualMachine Count: $vm"
            $total_count = $total_count + $vm
            $sub_count = $sub_count + $vm
        }

        foreach ($line in Get-Content .\resources.azure.list) {
            # echo "Line_ID $line for Id_Comp $Id_Comp"
            $res=$(az resource list --resource-type "$line" --query "[?contains(id,'$Id_Comp')]" --output table | wc -l)
            # echo "Result count for PaaS $res"
            # loop to count total PaaS resources for all ID's
            if ($res -gt 1) {
                # PaaS services are counted at 1:3 SU's
                $res = ($res - 2)/3
                $total_count = $total_count + $res
                $sub_count = $sub_count + $res
            }
        }
        $hashTable.Add($Id_Comp,$sub_count)
    }
}

$hashTable

echo "Total number of resources in all subscriptions: $total_count"
