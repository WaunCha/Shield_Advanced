variable "cloudwatch_alarms" {
  description = "List of Cloudwatch Alarms"
  type        = list(object({
    fqdn             = string
    type             = string
    port             = number
    resource_path    = string
    request_interval = number
    failure_threshold = number
  }))
  default = []
}

variable "account_id" {
  description = "AWS Account ID for Deployment"
}