# Terraform Demo of 3-Tier Architecture

Note: The Terraform configurations included in the demo does NOT involve database provisioning. The app tier of this demo is currently using a dummy httpd server, and does not involve dynamic data. 


## Terraform Modules used:
[terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest),
[terraform-aws-modules/security-group/aws](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest),
[terraform-aws-modules/ec2-instance/aws](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest),
[terraform-aws-modules/alb/aws](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest)


## Important Steps:
1. Initiate Terraform working directory. Config Terraform version and provider version. 
`versions.tf`, `terraform.tfvars`

1. Create a VPC using Terraform VPC module.
	`vpc.tf`, `vpc-variables.tf`, `vpc.auto.tfvars`, `vpc-outputs.tf`

1. Create Private EC2 instances, Bastion Host and Security Groups for them respectively.
	
	Note: In later steps, the Private EC2 instances would be replaced with ASG launch template. 
	- Create Security Groups using Terraform Security Group module.

		`securitygroup-bastion.tf`, `securitygroup-private.tf`, `securitygroup-variables.tf`, `securitygroup-outputs.tf`
 	- Get AMI dynamically using Datasource and create EC2 instances as Bastion using Terraform EC2 Module.
	`datasource-ami.tf`,`ec2-bastion.tf`, `ec2-variables.tf`, `ec2.auto.tfvars`, `ec2-outputs.tf`
	- Create a private EC2 instance for each private subnet using Terraform EC2 Module. 
	
		`ec2-private.tf`, `ec2-variables.tf`, `ec2.auto.tfvars`, `ec2-outputs.tf`
	- Create EIP and associate it with Bastion
	
		`eip.tf`, `ec2-outputs.tf`

1. Create ALB using Terraform Load Balancer Module.

	`alb.tf`, `alb-variables.tf`, `alb-ouputs.tf`, `securitygroup-lb.tf`

1. Create Launch Template for private instances and create ASG.
	`asg.tf`, `asg-variables.tf`,`asg-outputs.tf`
	Note: Remove the private instances created in previous steps. 

----
## To-do:
* Handle certain instance types not available in some azs. 
* Add Autoscaling notifications through SNS. 
* Add Target Tracking Scaling Policies for ASG to scale base on CPU utilization and ALB target request count. 
* CloudWatch Monitoring.