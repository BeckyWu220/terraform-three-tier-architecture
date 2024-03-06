locals {
  private_subnet_count = length(module.vpc.private_subnets)
}

module "private_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  #for_each = toset(["0", "1"])
  for_each = toset(formatlist("%s", range(0, local.private_subnet_count)))

  name = "${local.private_instance_name}-${each.value}"
  ami = data.aws_ami.amz-linux2-ami.id
  instance_type = var.private_instance_type
  key_name = var.instance_keypair
  user_data = file("${path.module}/app-install.sh")

  subnet_id = element(module.vpc.private_subnets, tonumber(each.value))

  vpc_security_group_ids = [module.private_sg.security_group_id]

  tags = local.common_tags

  # Relies on all resources of `vpc` module to be created first.
  depends_on = [ module.vpc ] 
}