package policy.terraform.rds

deny[msg] {
  input.resource.type == "aws_db_instance"
  not input.resource.values.storage_encrypted
  msg := sprintf("RDS instance %s not encrypted", [input.resource.address])
}
