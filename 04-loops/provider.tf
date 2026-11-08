terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


output "instance_create_public_ip" {
  value = "aws_instance.roboshop.public_ip"
}