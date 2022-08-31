terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.location
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = "terraformstatebermtec"
    key    = "Test/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "blah" {
  bucket = var.bucketname

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ProjectId = "1234567"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.blah.id
  acl    = "private"
}