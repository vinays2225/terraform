variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "AMI Id"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "Instance type"
}

variable "from_port" {
    type = number
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

    
variable "cidr_ipv4" {
    type = string
    default = "0.0.0.0/0"
}