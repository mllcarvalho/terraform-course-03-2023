data "aws_ami" "example" {

  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-arm64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "amis" {
    value = data.aws_ami.example.id
}


resource "aws_instance" "webapp" {
  ami                     = data.aws_ami.example.id
  instance_type           = "t2.micro"
  
  tags = {
      Name = "Web App 10"
  }
}

data "aws_vpc" "cachorro" {
    default = true
}

output "vpcs" {
    value = data.aws_vpc.cachorro.id
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

/*
data "aws_ssm_parameter" "ami" {
  name = "/dev/ami-linux"
}*/

data "aws_subnets" "subnets" {
    filter {
      name   = "tag:Name"
      values = ["ecs-cluster"]
    }
  }

