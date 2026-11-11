terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.70.0"
        }
    }

    backend "s3" {
    bucket         = "roboshop-dev-state-demo"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true # Native S3 locking for modern Terraform
  }

}

provider "aws"{
    region = "us-east-1"
}