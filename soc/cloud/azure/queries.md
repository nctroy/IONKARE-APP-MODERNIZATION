# Azure Queries (examples)

AzureActivity (role assignments outside change window):

```
AzureActivity
| where OperationNameValue == 'MICROSOFT.AUTHORIZATION/ROLEASSIGNMENTS/WRITE'
| project TimeGenerated, CallerIpAddress, Claims_s, CorrelationId, ResourceGroup
```

SignInLogs (suspicious sign-ins):

```
SignInLogs
| where ResultType != 0
| summarize count() by IPAddress, bin(TimeGenerated, 1h)
```
