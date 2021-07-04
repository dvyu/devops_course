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

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.test-example.id
  instance_id = aws_instance.ec2.id
}

resource "aws_ebs_volume" "test-example" {
  availability_zone = "eu-west-2a"
  size              = 10

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "ec2" {
  #count = 1
  ami           = "ami-0194c3e07668a7e36"
  availability_zone = "eu-west-2a"
  instance_type = "t2.micro"
  key_name = "test-key"
  security_groups = ["ssh-public"]

  tags = {
    Name = "EC2DevOpsCourse"
  }
}
