# SOC Runbook Template

- Title: <incident name>
- Scope: <systems, data, environments>
- Preconditions: <detection sources, severity>
- Stakeholders (RACI): <roles and contacts>
- Playbook ID: <unique id>

## 1. Detection and Verification
- Signals: <SIEM rules, cloud findings, app alerts>
- Triage checklist: <false positive screens, enrichment steps>

## 2. Containment
- Immediate actions: <account/session disable, network blocks, WAF rules>
- Isolation steps: <quarantine hosts, revoke tokens/keys>

## 3. Eradication and Remediation
- Root cause elimination: <patch, config fix, key rotation>
- Validation: <tests, scans, approvals>

## 4. Recovery
- Service restoration: <rollback/restore, phased reenablement>
- Monitoring: <heightened monitoring window>

## 5. Communications
- Internal updates cadence
- External comms (legal/PR) triggers

## 6. Evidence and Forensics
- Evidence to preserve and chain of custody steps
- Data retention and legal hold

## 7. Post-Incident
- Lessons learned, control gaps, action items with owners
- KPIs: MTTA/MTTR, dwell time, detection coverage

## 8. Automation Hooks
- SOAR playbooks and APIs
- Runbook tasks that can be automated

## 9. References
- Related tickets, docs, detections, controls
