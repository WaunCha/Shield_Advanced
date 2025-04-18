# AWS Shield Advanced with Terraform

This repository contains Terraform code to set up AWS Shield Advanced protections and related configurations. The repository includes multiple `.tf` files, each serving a specific purpose in the overall setup. Below is an explanation of the various Terraform files and their contents.

## providers.tf

This file configures the Terraform provider for AWS.

- **Terraform Configuration**: Specifies the required AWS provider version.
- **AWS Provider Configuration**: Sets the AWS region to `us-east-1`.

## shield.tf

This file creates AWS Shield Advanced protections for specific resources.

- **Data Sources**: Retrieves information about availability zones, the current region, and the AWS account identity.
- **Elastic IP**: Allocates an Elastic IP (EIP) with the tag "Dalkia-IP".
- **Shield Protection**: Sets up Shield Advanced protection for the EIP, tagged with "Dev".
- **Shield Protection Group**: Creates a protection group to cover all resources with aggregation set to "MAX" and pattern to "ALL".

## fms.tf

This file configures AWS Firewall Manager (FMS) policies for Shield Advanced.

- **FMS Admin Account**: Designates an account as the Firewall Manager administrator.
- **FMS Policy for Load Balancers**: Creates a policy to apply Shield Advanced protection to Elastic Load Balancers.
- **FMS Policy for CloudFront**: Creates a policy to apply Shield Advanced protection to CloudFront distributions.

## drt_role.tf

This file sets up IAM roles and policies for DDoS Response Team (DRT) access.

- **IAM Role for DRT**: Defines an IAM role with permissions for the DRT.
- **Role Policy Attachment**: Attaches the AWSShieldDRTAccessPolicy to the DRT role.
- **DRT Access Role ARN Association**: Associates the IAM role with Shield DRT access.
- **S3 Bucket for DRT Logs**: Creates an S3 bucket for storing DRT access logs.
- **Bucket ACL**: Sets the ACL for the S3 bucket to private.
- **Variable for Log Bucket**: Defines a variable for the S3 log bucket name.

## drt_proactive.tf

This file enables proactive engagement for Shield Advanced.

- **Shield Proactive Engagement**: Configures proactive engagement with emergency contact details.
- **Emergency Contacts Variable**: Defines a list of emergency contacts for proactive engagement.

## cloudwatch_alarms.tf

This file sets up CloudWatch alarms for monitoring Shield Advanced logs.

- **CloudWatch Log Group**: Creates a log group for Shield Advanced logs.
- **CloudWatch Log Stream**: Creates a log stream within the log group.
- **CloudWatch Metric Alarms**: Defines CloudWatch alarms based on the specified metrics and dimensions.
- **CloudWatch Alarms Variable**: Defines a variable for the list of CloudWatch alarms.

## healthcheck.tf

This file creates Route 53 health checks.

- **Route 53 Health Checks**: Configures health checks for specified FQDNs and parameters.
- **Health Checks Variable**: Defines a variable for the list of Route 53 health checks.

## terraform.tfvars

This file contains variable values for the Terraform configuration.

- **S3 Log Bucket**: Specifies the S3 bucket name for Shield DRT access logs.
- **Emergency Contacts**: Lists the emergency contacts for proactive engagement.
- **Route 53 Health Checks**: Lists the health checks for Route 53.

## How to Run

To deploy this configuration using Terraform, follow these steps:

Initialize the Terraform Working Directory: This step downloads the necessary provider plugins.

`terraform init`

Preview the Actions Terraform Will Take: This step shows the actions Terraform will take to achieve the desired state.

`terraform plan`

Apply the Terraform Configuration: This step applies the configuration to achieve the desired state.

`terraform apply`

Confirm the Apply Step: You will be prompted to confirm the apply step. Type yes and press Enter.
---

By structuring the Terraform code in this manner, we can efficiently manage AWS Shield Advanced protections, Firewall Manager policies, IAM roles for DRT access, proactive engagement settings, CloudWatch alarms, and Route 53 health checks. For further customization, modify the variables in `terraform.tfvars` to match your specific requirements.