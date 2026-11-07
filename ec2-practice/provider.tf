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

# Output the public IP address after creation
output "demo_instance_public_ip" {
  value = aws_instance.terraform-ec2.public_ip
}

output "expense_instance_public_ip" {
  value = aws_instance.expense-ec2.public_ip
}