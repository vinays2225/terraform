terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }

  backend "s3" {
    bucket       = "roboshop-dev-state-demo"
    key          = "workspace.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

}

output "publicip" {
  value = aws_instance.worksapce-dev.public_ip
}