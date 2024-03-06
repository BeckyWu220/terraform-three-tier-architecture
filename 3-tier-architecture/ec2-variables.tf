# Bastion
variable "bastion_instance_type" {
  description = "Bastion EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "bastion_instance_name" {
  description = "Bastion EC2 instance name"
  type = string
  default = "Bastion"
}

variable "instance_keypair" {
  description = "EC2 Key Pair Name"
  type = string
}

# Private EC2 instances
variable "private_instance_type" {
  description = "Private EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "private_instance_name" {
  description = "Private EC2 instance name"
  type = string
  default = "PrivateVM"
}

variable "private_instance_count" {
  description = "Number of Private EC2 instance"
  type = number
  default = 1
}