# CIS Benchmark Checklist (Cloud Native Focus)

Goal: Track implementation of CIS foundational controls and automate continuous monitoring. Map items to tools (AWS Config/Security Hub, Prowler, ScoutSuite, OPA).

Legend: [ ] Not started  [~] In progress  [x] Implemented

## 1. Identity and Access Management
- [ ] Root account MFA enabled; no access keys for root
- [ ] MFA required for privileged roles; hardware keys for admins
- [ ] IAM Access Analyzer enabled; cross-account access reviewed
- [ ] Least privilege managed via IAM roles; no wildcard policies
- [ ] Credential rotation policies and reports; no unused keys > 90d

## 2. Logging and Monitoring
- [ ] CloudTrail enabled org-wide; log file validation on; S3 bucket locked
- [ ] Config enabled with conformance packs; delivery to central bucket
- [ ] GuardDuty enabled in all regions; findings forwarded to SIEM
- [ ] VPC Flow Logs and ALB/WAF logs enabled; retention defined
- [ ] Centralized SIEM with alert rules and dashboards

## 3. Networking
- [ ] No public access to databases or internal services
- [ ] Security Groups least privilege; no 0.0.0.0/0 for admin ports
- [ ] Private subnets for services; NAT or VPC endpoints for egress
- [ ] WAF with managed rules and rate limiting on public endpoints

## 4. Compute and Container Security
- [ ] Minimal base images; non-root containers; read-only FS where possible
- [ ] Image scanning in CI and registry; signed images (cosign)
- [ ] IMDSv2 enforced for EC2; SSM/Inspector enabled
- [ ] Patch management SLAs defined and tracked

## 5. Data Protection
- [ ] Encryption at rest with KMS CMKs; key rotation policy
- [ ] TLS 1.2+ enforced in transit; modern ciphers
- [ ] S3 buckets private by default; Block Public Access enabled
- [ ] Backups encrypted and tested; retention documented
- [ ] Secrets in Secrets Manager/Parameter Store; rotation configured

## 6. Governance and Compliance
- [ ] SCP guardrails defined and enforced
- [ ] Tagging standards and budget alerts configured
- [ ] Automated evidence collection for audits (change, access, config)

## 7. Application Security
- [ ] SAST/DAST/Dependency scanning in CI with gates
- [ ] SBOM generated and stored for releases; provenance attestations (SLSA)
- [ ] Security headers (HSTS, CSP, XFO, XCTO, RP) enforced
- [ ] Rate limits and abuse prevention in API Gateway/WAF and app

## Monitoring & Automation Plan
- Use AWS Security Hub with CIS standards, plus AWS Config rules
- Run Prowler/ScoutSuite on schedule; ingest results to SIEM
- Policy as Code with OPA/Conftest in CI for Terraform and Kubernetes
- Continuous validation pipelines and drift detection
