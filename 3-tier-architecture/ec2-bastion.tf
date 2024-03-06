module "bastion_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = local.bastion_instance_name
  ami = data.aws_ami.amz-linux2-ami.id
  instance_type = var.bastion_instance_type
  key_name = var.instance_keypair
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.bastion_sg.security_group_id]

  tags = local.common_tags
}