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

output "public_ip" {
  value = "aws_instance.provisioner-demo.public_ip"
}