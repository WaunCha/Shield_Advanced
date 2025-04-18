# Create Protection

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_eip" "public_ip_ip" {
  domain = "vpc"
  tags = {
    Name = "Public-IP"
  }
}

resource "aws_shield_protection" "shield" {
  name         = "ShieldAdvanced"
  resource_arn = "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:eip-allocation/${aws_eip.public_ip.id}"

  tags = {
    Environment = "Dev"
  }
}

# Create Protection for All Resources

resource "aws_shield_protection_group" "all" {
  protection_group_id = "all"
  aggregation         = "MAX"
  pattern             = "ALL"
}