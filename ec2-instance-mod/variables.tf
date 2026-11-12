variable "instance_type" {
    type= string
    default = "t3.micro"
}

variable "project"{
    type=string
}
variable "environment"{
    type=string
}
variable "component"{
    type=string
}

variable "security-groups" {
  type = list
}

variable "ec2-tags"{
    default = {}
}