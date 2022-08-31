#Create security group with firewall rules
resource "aws_security_group" "my_security_group" {
  name        = "default-1"
  description = "security group for Ec2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "default-1"
  }
}

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


