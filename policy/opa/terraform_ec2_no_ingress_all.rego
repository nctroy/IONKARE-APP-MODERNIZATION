package policy.terraform.security_groups

deny[msg] {
  input.resource.type == "aws_security_group_rule"
  input.resource.values.cidr_blocks[_] == "0.0.0.0/0"
  not (input.resource.values.from_port == 80; input.resource.values.to_port == 80)
  not (input.resource.values.from_port == 443; input.resource.values.to_port == 443)
  msg := sprintf("SG rule %s allows 0.0.0.0/0 to port %v-%v", [input.resource.address, input.resource.values.from_port, input.resource.values.to_port])
}
