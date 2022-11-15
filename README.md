# Count Azure resources for ServiceNow Subscription Unit licensing.
Powershell script to count resources across multiple Azure subscriptions ID's to help determine ServiceNow Subscription Unit licenses.

Run this script in an Azure Powershell terminal.

## Example output
```powershell
PS /> ./azure_resources.ps1
Current subscription is 
340dea95-xxxx-4409-95f5-xxxxxxxxxxxxxx
VirtualMachine Count: 8

Name                           Value
----                           -----
340dea95-xxxx-4409-95f5-xxxxx… 10.3333333333333
Total number of resources in all subscriptions: 10.3333333333333
```
