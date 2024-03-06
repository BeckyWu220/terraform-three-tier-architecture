module "bastion_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.1"

    name = "bastion-sg"
    description = "Security Group for Bastion"
    vpc_id = module.vpc.vpc_id

    tags = local.common_tags

    # Ingress rules
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules = ["ssh-tcp"]

    # Egress rules
    egress_rules = ["all-all"]

}