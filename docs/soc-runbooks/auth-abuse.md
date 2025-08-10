# Runbook: Authentication Abuse / Credential Stuffing

Playbook ID: SOC-AUTH-ABUSE-001

## Detection
- WAF/Edge bot detections, login rate anomalies
- App signals: repeated login failures across many accounts/IPs
- Threat intel: leaked credential lists observed

## Triage
- Verify spikes vs normal baseline; check IP reputation
- Sample requests for user-agent and automation patterns

## Containment
- Enable/raise WAF rate limits and bot rules
- Force MFA challenge for suspicious sessions
- Block offending IPs/CIDRs temporarily

## Eradication
- Breached password checks; invalidate tokens for impacted users
- Recommend password resets and enable MFA

## Recovery
- Monitor auth metrics; tune thresholds; remove emergency blocks after stability

## Communications
- Notify support and affected users if accounts accessed

## Evidence
- Preserve logs: WAF, ALB, app auth logs, SIEM alerts

## Automation
- SOAR: auto-block IPs, auto-enable MFA, auto-notify users on suspicious activity
