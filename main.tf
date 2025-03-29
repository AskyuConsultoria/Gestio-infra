terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "keys" {
  source = "./modules/keys"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}   

module "bastion" {
  source = "./modules/bastion"
  ami           = var.ami
  bastion_instance_type = var.bastion_instance_type
  pbkey_name        = var.pbkey_name
  security_groups = [module.vpc.security_group_id]
  public_subnet_id = module.vpc.public_subnet_id
}   

module "private_instance" {
  source = "./modules/private_instance"
  ami           = var.ami
  private_instance_type = var.private_instance_type
  pvkey_name       = var.pvkey_name
  security_groups = [module.vpc.security_group_id]
  private_subnet_id = module.vpc.private_subnet_id
}   

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "private_instance_ip" {
  value = module.private_instance.private_instance_ip
}


