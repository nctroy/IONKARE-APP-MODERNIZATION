# Runbook: Supply Chain / Dependency Compromise

Playbook ID: SOC-SUPPLY-001

## Detection
- SCA alerts (Snyk/Dependabot), package repo advisories, image scans

## Triage
- Confirm exposure in SBOM; identify affected versions and services

## Containment
- Pin/rollback versions; block artifact promotion

## Eradication
- Patch to fixed versions; rebuild signed artifacts; rotate credentials

## Recovery
- Canary, monitor, full rollout

## Communications
- Advisory to customers if impact; internal coordination

## Evidence
- Build logs, SBOMs, signatures, CI/CD records

## Automation
- SOAR: auto-open tickets, block deploys on critical CVEs, notify owners
