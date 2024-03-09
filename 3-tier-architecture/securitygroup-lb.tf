module "lb_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.1"
    
    name = "lb-sg"
    description = "Security Group for Load Balancer"
    vpc_id = module.vpc.vpc_id

    tags = local.common_tags

    # Ingress rules
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules = ["http-80-tcp"]

    # Egress rules
    egress_rules = ["all-all"]

}