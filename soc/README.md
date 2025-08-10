# Security Operations Center (SOC)

This folder centralizes open-source SIEM/SOAR scaffolding and cloud-native visibility artifacts for demos and interviews.

Structure
- `opensearch/`: Docker Compose for OpenSearch + Dashboards (optional local demo)
- `dashboards/`: Saved objects placeholders (import into OpenSearch Dashboards/Kibana)
- `cloud/`: Cloud-native detection and query examples per provider

Notes
- Use with the runbooks under `docs/soc-runbooks/` and detections under `detections/sigma/`.
- Keep datasets synthetic; no real PHI/PII.
