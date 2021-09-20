# Count Azure resources for ServiceNow Subscription Unit licensing.
Powershell script to count resources across multiple Azure subscriptions ID's to help determine ServiceNow Subscription Unit licenses.

Run this script in an Azure Powershell terminal.

## Example output
```powershell
PS /> ./azure_resources.ps1
ID:

[

ID:

 "58544991-ca16-4bb1-b9a0-49862a61c7ed",

ID:

 "0d46bd47-e777-4928-b6ba-46f412cdd451",

ID:

 "d51f0392-940e-4b7f-841b-3c94c8634883",

Microsoft.Cache/Redis Count: 0.333333333333333

Microsoft.Web/sites Count: 0.333333333333333

ID:

 "8a8a5346-5217-4b8e-8f53-4f4eb76e0753",

ID:

 "0e983eb3-5b2c-45a9-ad0a-bb7d905ec1c6",

ID:

 "d923fbce-113f-4131-bc24-7c7ab2144608"

VirtualMachine Count: 4

ID:

]

Total number of resources in all subscriptions: 4.66666666666667
