module "private_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.1"

    name = "private-sg"
    description = "Security Group with HTTP and SSH port open for VPC, ${local.vpc_name}."
    vpc_id = module.vpc.vpc_id

    tags = local.common_tags

    # Ingress rules
    ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
    ingress_rules = ["ssh-tcp", "http-80-tcp"]

    # Egress rules
    egress_rules = ["all-all"]

}