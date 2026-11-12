variable "instance_types" {
  type = map(any)
  default = {
    dev  = "t3.micro"
    sit  = "t3.small"
    uat  = "t3.small"
    prod = "t3.medium"
  }
}

variable "common-tags" {
  default = {
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "Yes"
  }
}