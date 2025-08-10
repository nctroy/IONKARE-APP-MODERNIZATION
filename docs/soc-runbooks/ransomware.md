# Runbook: Ransomware / Malware Outbreak

Playbook ID: SOC-RANSOM-001

## Detection
- EDR alerts, abnormal encryption activity, IOC hits

## Triage
- Scope impacted hosts/containers; verify indicators

## Containment
- Isolate hosts; disable suspicious accounts; block C2 domains

## Eradication
- Clean images, patch vulnerabilities, rotate secrets

## Recovery
- Restore from backups (tested); validate integrity

## Communications
- Legal/PR coordination; law enforcement if needed

## Evidence
- EDR telemetry, disk images/snapshots, logs

## Automation
- SOAR: isolate hosts, block indicators, trigger backup validation
