# Bastion Security Group
output "bastion_sg_id" {
  description = "The ID of the security group"
  value       = module.bastion_sg.security_group_id
}

output "bastion_sg_vpc_id" {
  description = "The VPC ID"
  value       = module.bastion_sg.security_group_vpc_id
}

output "bastion_sg_name" {
  description = "The name of the security group"
  value       = module.bastion_sg.security_group_name
}

# Private Security Group
output "private_sg_id" {
  description = "The ID of the security group"
  value       = module.private_sg.security_group_id
}

output "private_sg_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sg.security_group_vpc_id
}

output "private_sg_name" {
  description = "The name of the security group"
  value       = module.private_sg.security_group_name
}

