# AWS Queries (examples)

CloudTrail Insights (suspicious AssumeRole bursts):

```
fields eventTime, eventName, userIdentity.principalId, sourceIPAddress
| filter eventName = 'AssumeRole'
| stats count() by sourceIPAddress, bin(1h)
| sort by count() desc
```

GuardDuty: Triage findings by severity and resource:

```
fields severity, title, resource.resourceType, service.eventFirstSeen, service.eventLastSeen
| sort by severity desc
```
