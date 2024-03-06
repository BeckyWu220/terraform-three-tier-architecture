# Bastion
output "bastion_id" {
    description = "Bastion ID"
    value = module.bastion_ec2.id
}

output "bastion_public_ip" {
    description = "Bastion Public IP"
    value = module.bastion_ec2.public_ip
}

output "bastion_eip" {
    description = "Bastion EIP"
    value = aws_eip.bastion_eip.public_ip
}

# Private Instance
output "private_instance_ids" {
    description = "Private Instance IDs"
    value = [for instance in module.private_ec2: instance.id]
}

output "private_instance_private_ips" {
    description = "Private Instance Private IPs"
    value = [for instance in module.private_ec2: instance.private_ip]
}