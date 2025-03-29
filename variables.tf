
variable "pvkey_name" {}
variable "pbkey_name" {}

variable "vpc_cidr_block" {
  description = "CIDR da VPC"
  type        = string
}


variable "public_subnet_cidr" {
  description = "CIDR da Subnet Pública"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR da Subnet Privada"
  type        = string
}

variable "ami" {}
variable "bastion_instance_type" {}
variable "private_instance_type" {}

