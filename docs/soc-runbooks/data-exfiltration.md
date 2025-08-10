# Runbook: Data Exfiltration

Playbook ID: SOC-DATA-EXFIL-001

## Detection
- GuardDuty/CloudTrail anomalies, unusual S3 GET/LIST, large egress
- App logs: bulk exports, abnormal query patterns

## Triage
- Identify principals, resources, timeframe; confirm exfil paths

## Containment
- Revoke access keys/sessions; lock buckets/objects; rotate creds
- Block egress at firewall; suspend offending workloads

## Eradication
- Remove malicious access paths; fix policies; enable bucket/object lock where needed

## Recovery
- Restore service with least privilege; enable heightened monitoring

## Communications
- Legal/privacy review; regulatory notifications if PHI affected

## Evidence
- Preserve CloudTrail, S3 server access logs, VPC Flow Logs, app logs

## Automation
- SOAR: automatic revoke/rotate; quarantine policies; ticketing
