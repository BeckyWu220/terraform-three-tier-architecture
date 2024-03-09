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
