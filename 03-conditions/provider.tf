terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.70.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}


output "expense_instance_public_ip" {
  value = aws_instance.ec2-condions.public_ip
}