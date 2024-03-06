module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name = local.vpc_name
  cidr = var.vpc_cidr_block

  azs = var.vpc_azs
  public_subnets = var.vpc_public_subnets
  public_subnet_tags = {
    Name = "public-subnets"
  }

  private_subnets = var.vpc_private_subnets
  private_subnet_tags = {
    Name = "private-subnets"
  }

  create_database_subnet_group = var.vpc_create_db_subnet_group
  create_database_subnet_route_table = var.vpc_create_db_subnet_route_table
  database_subnets = var.vpc_database_subnets
  database_subnet_tags = {
    Name = "database-subnets"
  }

  enable_nat_gateway = var.vpc_enable_nat_gateway # Enable NAT Gateways for each private subnet
  single_nat_gateway = var.vpc_single_nat_gateway # Share a single NAT Gateway across all private networks. 

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = local.common_tags

  vpc_tags = local.common_tags
}