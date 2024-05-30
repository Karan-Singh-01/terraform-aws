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

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "main_vpc"
  version = "5.8.1"
  cidr = var.cidr_block

  azs             = var.availability_zones
  public_subnets  = [cidrsubnet(var.cidr_block, 8, 0), cidrsubnet(var.cidr_block, 8, 1)]
  private_subnets = [cidrsubnet(var.cidr_block, 8, 2), cidrsubnet(var.cidr_block, 8, 3)]

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false
  external_nat_ip_ids    = "${aws_eip.nat.*.id}"
}

resource "aws_eip" "nat" {
  count = 2
  domain = "vpc"
}

