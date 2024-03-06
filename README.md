Objectives: Create a 3-Tier Architecture using Terraform

Terraform Modules used:
- [terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
- [terraform-aws-modules/security-group/aws](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest)
- [terraform-aws-modules/ec2-instance/aws](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)

Important Steps:
- Initiate Terraform working directory. Config Terraform version and provider version. 
`versions.tf`, `terraform.tfvars`
- Create a VPC using Terraform VPC module. 
`vpc.tf`, `vpc-variables.tf`, `vpc.auto.tfvars`, `vpc-outputs.tf`
- Create Private EC2 instances, Bastion Host and Security Groups for them respectively.
- - Create Security Groups using Terraform Security Group module.
`securitygroup-bastion.tf`, `securitygroup-private.tf`, `securitygroup-variables.tf`, `securitygroup-outputs.tf`
- - Get AMI dynamically using Datasource and create EC2 instances as Bastion using Terraform EC2 Module.
`datasource-ami.tf`
`ec2-bastion.tf`, `ec2-variables.tf`, `ec2.auto.tfvars`, `ec2-outputs.tf`
- - Create a private EC2 instance for each private subnet using Terraform EC2 Module. 
`ec2-private.tf`, `ec2-variables.tf`, `ec2.auto.tfvars`, `ec2-outputs.tf`
- - Create EIP and associate it with Bastion
`eip.tf`, `ec2-outputs.tf`
- - null resource

- - Create ALB
- - DB
- - ASG
- - CloudWatch

----
To-do:
- Handle certain instance types not available in some azs. 
- Make the private EC2 instances dynamically pick up the number of private subnets. 