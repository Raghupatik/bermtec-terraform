
provider "aws" {
  access_key = var.key
  secret_key = var.secret
  region     = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"
    }
  }

  # backend "s3" {
  #   bucket = "my-cistestbucket-2788"
  #   key    = "test/terraform.tfstate"
  #   region = "us-west-2"
  # }
}


# resource "tls_private_key" "example" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "generated_key" {
#   key_name   = var.key_name
#   public_key = tls_private_key.example.public_key_openssh

#   provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
#     interpreter = ["bash", "-c"]
#     command = <<-EOT
#       echo '${tls_private_key.example.private_key_pem}' > ./'${var.key_name}'.pem
#       sudo chmod 400 ./'${var.key_name}'.pem
#     EOT
#   }
# }


# data "aws_vpc" "selected" {
#   filter {
#     name   = "tag:Name"
#     values = ["terraform-demo-vpc"]
#   }
# }

# data "aws_subnet" "selected" {
#   filter {
#     name   = "tag:Name"
#     values = ["terraform-subnet_1"]
#   }
# }

# data "aws_security_group" "selected" {
#   filter {
#     name   = "tag:Name"
#     values = ["ec2-sg1"]
#   }
# }

resource "aws_instance" "terraform_wapp" {
  ami                         = var.ami
  instance_type               = var.instance_type
  # vpc_security_group_ids      = ["${data.aws_security_group.selected.id}"]
  vpc_security_group_ids      = ["sg-089c40d4eedaecd72"]
  subnet_id                   = "subnet-011ad7fd3ad365ae4"
  count                       = 2
  associate_public_ip_address = true
  key_name                    = var.key_name
  tags = {
    Name        =  "${var.instance_name}"
    Environment = "Dev"
    Project     = "DEMO-TERRAFORM"
  }
}


