# IONKARE Infrastructure (Interview Stacks)

Purpose: lightweight, low-cost Infrastructure as Code (IaC) scaffolding to demonstrate security architecture across AWS, Azure, and GCP. These are placeholders designed to validate workflow, policy gates, and planning. They are not intended for automatic apply.

Structure

```
infrastructure/
  modules/
    baseline-network/
    baseline-security/
    baseline-logging/
    baseline-waf/
  aws/azure/gcp/
    envs/interview/
```

Key ideas
- Cloud-agnostic module names with cloud-specific implementations per environment.
- Keep resources minimal; validate, not apply, by default.
- CI runs fmt/validate on the `interview` branch; policy gates handled by Checkov and OPA Conftest.

How to run locally (plan-only)

```
make -C infrastructure init TF_DIR=aws/envs/interview
make -C infrastructure validate TF_DIR=aws/envs/interview
make -C infrastructure plan TF_DIR=aws/envs/interview
```

Safety and cost
- Placeholders have no live resources. When you introduce resources, prefer free/low-cost services and always provide `destroy` steps.

Next steps
- Implement each module with minimal secure-by-default resources: logging, audit, and WAF edges.
- Add OIDC for GitHub Actions to assume per-cloud roles for plan/apply (manual approvals only).


