resource "aws_vpc" "vpc-01" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = merge(
    local.additional_tags,
    {
      Name = "vpc-01"
    },
  )
}