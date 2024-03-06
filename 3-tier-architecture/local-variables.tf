locals {
  vpc_name = "${var.vpc_name}-${var.env}"
  common_tags = {
    vpc = local.vpc_name
    Environment = var.env
  }
  bastion_instance_name = "${var.bastion_instance_name}-${var.env}"
  private_instance_name = "${var.private_instance_name}-${var.env}"
}