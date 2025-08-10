package policy.terraform.cloudtrail

deny[msg] {
  input.resource.type == "aws_cloudtrail"
  not input.resource.values.is_multi_region_trail
  msg := sprintf("CloudTrail %s not multi region", [input.resource.address])
}
