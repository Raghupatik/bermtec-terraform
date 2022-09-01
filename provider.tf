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
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}