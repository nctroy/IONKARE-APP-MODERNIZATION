package policy.terraform.s3

deny[msg] {
  input.resource.type == "aws_s3_bucket"
  public := input.resource.values.acl
  public == "public-read" or public == "public-read-write"
  msg := sprintf("S3 bucket %s has public ACL %s", [input.resource.values.bucket, public])
}

deny[msg] {
  input.resource.type == "aws_s3_bucket_public_access_block"
  not input.resource.values.block_public_acls
  msg := sprintf("S3 bucket public access block disabled for %s", [input.resource.address])
}
