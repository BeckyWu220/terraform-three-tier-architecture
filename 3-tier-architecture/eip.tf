resource "aws_eip" "bastion_eip" {
  depends_on = [ module.vpc, module.bastion_ec2 ]

  instance = module.bastion_ec2.id
  domain = "vpc"

  tags = local.common_tags
}