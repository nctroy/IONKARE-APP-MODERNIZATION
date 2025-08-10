# Runbook: DDoS / Availability Attack

Playbook ID: SOC-DDOS-001

## Detection
- Edge/WAF alerts; elevated 5xx/latency

## Triage
- Identify vectors (L7/L3-4), sources, target endpoints

## Containment
- Enable WAF managed rules, rate limiting, geo/IP blocks
- Scale out edge; enable Shield Advanced if available

## Eradication
- Long-term filtering, upstream provider coordination

## Recovery
- Reduce rules after stability; capacity review

## Communications
- Status updates to stakeholders; public status page if applicable

## Evidence
- WAF/Edge logs, provider reports, app metrics

## Automation
- SOAR: auto-scale WAF rules, temporary blocks, status updates
