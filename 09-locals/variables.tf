variable "instance_type" {
    description = "The type of instance to use for the EC2 instance"
    type        = string
    default     = "t3.micro"
}

variable "project" {
    description = "The name of the project"
    type        = string
    default     = "demo-sate"
}

variable "region" {
    description = "The AWS region to deploy resources in"
    type        = string
    default     = "us-east-1"
}

variable "environment" {
    description = "The environment to deploy resources in"
    type        = string
    default     = "dev"
}