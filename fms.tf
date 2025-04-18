# FMS Admin

resource "aws_fms_admin_account" "admin_account" {
  account_id = var.account_id
}

# FMS Policy for Global/Regional Resources Shield Advanced

resource "aws_fms_policy" "shield_advanced" {
  exclude_resource_tags = false
  name                  = "ShieldAdvancedLoadBalancerPolicy"
  remediation_enabled   = false
  resource_type         = "AWS::ElasticLoadBalancing::LoadBalancer"

  security_service_policy_data {
    type = "SHIELD_ADVANCED"
    managed_service_data = jsonencode({
      type        = "WAFV2"
      rule_groups = []
    })
  }
}

resource "aws_fms_policy" "shield_advanced_cloudfront" {
  exclude_resource_tags = false
  name                  = "ShieldAdvancedCloudFrontPolicy"
  remediation_enabled   = false
  resource_type         = "AWS::CloudFront::Distribution"

  security_service_policy_data {
    type = "SHIELD_ADVANCED"
    managed_service_data = jsonencode({
      type        = "WAFV2"
      rule_groups = []
    })
  }
}
