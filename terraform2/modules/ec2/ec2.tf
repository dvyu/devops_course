data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.sg_ids
  root_block_device {
    volume_size = var.root_disk_size
  }

  tags = {
    Name = var.name
    Env = var.env
  }
}
