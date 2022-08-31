
# # terraform {
# #   required_providers {
# #     aws = {
# #       source = "hashicorp/aws"
# #       version = "4.14.0"
# #     }
# #   }

# #   # backend "s3" {
# #   #   bucket = "value"
# #   #   key= ""
# #   #   region = "us-east-1"
# #   # }
# # }
# provider "aws" {
#   access_key = "AKIAWABC6GF62FMHUAKK"
#   secret_key = "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"
#   region     = "us-east-1"
# }

# variable "key_name" {
#   type = string
#   default = "Test"
# }

# # resource "tls_private_key" "example" {
# #   algorithm = "RSA"
# #   rsa_bits  = 4096
# # }

# # resource "aws_key_pair" "generated_key" {
# #   key_name   = var.key_name
# #   public_key = tls_private_key.example.public_key_openssh

# #   provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
# #     interpreter = ["bash", "-c"]
# #     command = <<-EOT
# #       echo '${tls_private_key.example.private_key_pem}' > ./'${var.key_name}'.pem
# #       sudo chmod 400 ./'${var.key_name}'.pem
# #     EOT
# #   }
# # }

# ## Create VPC ##
# resource "aws_vpc" "terraform-vpc" {
#   cidr_block           = "172.16.0.0/16"
#   enable_dns_hostnames = true
#   tags = {
#     Name = "terraform-demo-vpc"
#   }
# }


# ## Create Subnets ##
# resource "aws_subnet" "terraform-subnet_1" {
#   vpc_id            = aws_vpc.terraform-vpc.id
#   cidr_block        = "172.16.10.0/24"
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "terraform-subnet_1"
#   }
# }

# # resource "aws_key_pair" "deployer" {
# #   key_name   = "${var.key_name}"
# #   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 bermcis6@gmail.com"
# # }

# ## Security Group##
# resource "aws_security_group" "terraform_private_sg" {
#   description = "Allow limited inbound external traffic"
#   vpc_id      = aws_vpc.terraform-vpc.id
#   name        = "terraform_ec2_private_sg"

#   ingress {
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 22
#     to_port     = 22
#   }

#    ingress {
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 8080
#     to_port     = 8080
#   }

#   egress {
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 0
#     to_port     = 0
#   }

#   tags = {
#     Name = "ec2-private-sg"
#   }
# }

# resource "aws_instance" "terraform_wapp" {
#   ami                         = "ami-0ed9277fb7eb570c9"
#   instance_type               = "t2.micro"
#   vpc_security_group_ids      = ["${aws_security_group.terraform_private_sg.id}"]
#   subnet_id                   = aws_subnet.terraform-subnet_1.id
#   count                       = 1
#   associate_public_ip_address = true
#   key_name      = "${var.key_name}"
#   tags = {
#     Name        = "terraform_ec2_demo2"
#     Environment = "development"
#     Project     = "DEMO-TERRAFORM"
#   }
# }

# output "instance_id_list" { 
#   value = ["${aws_instance.terraform_wapp.*.id}"] 
# }

# output "aws_vpc_id" {
#   value = aws_vpc.terraform-vpc.id
# }

# output "aws_subnet_subnet_id" {
#   value = aws_subnet.terraform-subnet_1.id
# }

# output "aws_security_gr_id" {
#   value = aws_security_group.terraform_private_sg.id
# }
