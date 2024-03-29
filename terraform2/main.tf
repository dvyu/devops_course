terraform {
 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.12.31"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
  shared_credentials_file = "/credentials"
}

module "vpc" {
  source = "./modules/vpc"
  env = "devops_cource"
  az = "eu-west-2"
}

resource "aws_key_pair" "install_key" {
  key_name   = "install-key"
  public_key = "${file(var.public_key)}"
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.public_subnet_id
  sg_ids = [module.vpc.public_sg_id]
  name = "web"
  env = "devops_cource"
  key_name = "${aws_key_pair.install_key.key_name}"
}


