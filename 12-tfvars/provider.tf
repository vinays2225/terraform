terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }

  backend "s3" {



  }
}

output "tfvars-demo" {
  value = aws_instance.tfvars-demo.public_ip
}