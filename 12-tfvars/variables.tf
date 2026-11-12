variable "instance_type" {
  type = string
}

variable "environment" {
  type = string
}


variable "common-tags" {
  type = map(any)
}