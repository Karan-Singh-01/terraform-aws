terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.47.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "network" {
  source             = "./modules/network"
  availability_zones = var.availability_zones
}

module "security" {
  source        = "./modules/security"
  vpc_id        = module.network.vpc_id
  ingress_rules = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "PORT-80"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "iam" {
  source = "./modules/iam"
}

module "application" {
  source               = "./modules/application"
  security_group_id    = module.security.security_group_id
  lb_security_group_id = module.security.lb_security_group_id
  vpc_id               = module.network.vpc_id
  public_subnets       = module.network.public_subnets
  private_subnets      = module.network.private_subnets
  key_name             = var.key_name
  instance_profile     = module.iam.ssm_profile

  asg_desired          = "2"
  asg_max_size         = "3"
  asg_min_size         = "1"

  ebs_block_device = [
    { device_name           = "/dev/sdb"
      volume_type           = "gp2"
      volume_size           = 50
      delete_on_termination = true
    }
  ]
}
