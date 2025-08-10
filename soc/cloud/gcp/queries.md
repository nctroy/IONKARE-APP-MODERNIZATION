# GCP Queries (examples)

Audit Logs (privilege changes):

```
resource.type="project"
protoPayload.methodName="SetIamPolicy"
```

VPC Flow Logs (top talkers):

```
resource.type="gce_subnetwork"
jsonPayload.connection.dest_port=443
| count by jsonPayload.connection.src_ip
```
