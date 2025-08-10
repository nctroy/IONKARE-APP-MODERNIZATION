# Conftest / OPA Policy for Terraform

Usage:
- Install conftest: https://www.conftest.dev/
- Test Terraform plan in JSON:

```bash
terraform init && terraform plan -out tfplan.bin
terraform show -json tfplan.bin > tfplan.json
conftest test --input terraform tfplan.json -p policy/opa
```

Policies:
- S3: public ACLs blocked and access block required
- Security Groups: deny 0.0.0.0/0 except 80/443
- Tags: require Owner, Environment, CostCenter
- RDS: storage encryption required
- CloudTrail: must be multi region
