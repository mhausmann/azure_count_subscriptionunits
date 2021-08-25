$total_count = 0
# Get Azure Subscriptions ID's
$GroupList = az account list --query '[].id'

# Loop for each Azure Subscription ID
foreach ($id in $GroupList) {
        echo "ID:" $id
        if ($id.length -gt 4) {
        # use for loop to read all values and ID
                $vm=$(az resource list --resource-type "Microsoft.Compute/virtualmachines" --query "[?contains(id,'$CharArray')]" --output table | wc -l)
                        if ($vm -gt 1) {
                                # Server resources are counted at 1:1 SU
                                $vm = $vm - 2
                                echo "Resource type VirtualMachine:" $line $vm
                                $total_count = $total_count + $vm
                        }
                foreach ($line in Get-Content .\resources.azure.list) {
                        $CharArray = $id.substring(2,24).Trim('"', " ")
                        $res=$(az resource list --resource-type "$line" --query "[?contains(id,'$CharArray')]" --output table | wc -l)
                        # loop to count total resources for all ID's
                        if ($res -gt 1) {
                                # PaaS services are counted at 1:3 SU's
                                $res = ($res - 2)/3
                                echo "Resource type:" $line $res
                                $total_count = $total_count + $res
                        }
                }
       }
}
echo "Total number of resources in all subscriptions: $total_count"