package policy.terraform.tags

required_tags := {"Owner", "Environment", "CostCenter"}

deny[msg] {
  input.resource.values.tags is null
  msg := sprintf("Resource %s missing required tags", [input.resource.address])
}

deny[msg] {
  tag := required_tags[_]
  not input.resource.values.tags[tag]
  msg := sprintf("Resource %s missing tag %s", [input.resource.address, tag])
}
