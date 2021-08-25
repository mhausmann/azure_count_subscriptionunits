# azure_count_subscriptionunits
Powershell script to count resources for ServiceNow Subscription Unit licenses.

Run this script in an Azure Powerhsell terminal.

## Example output
```powershell
PS /> ./azure_resources.ps1
ID:
[
ID:
  "340dea95-def9-xxxx-95f5-xxxxxxxxxxx"
Resource type VirtualMachine:
14
Resource type:
Microsoft.DBforMySQL/servers
0.333333333333333
Resource type:
Microsoft.Web/sites
1.66666666666667
ID:
]
```
Total number of resources in all subscriptions: 16
