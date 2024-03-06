variable "vpc_name" {
  description = "VPC Name"
  type = string
}

variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR Block"
}

variable "vpc_azs" {
  description = "VPC AZs"
  type = list(string)
}

variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
}

variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
}

variable "vpc_create_db_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type = bool
}

variable "vpc_create_db_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type = bool
}

variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type = bool
}

variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type = bool
  default = false
}