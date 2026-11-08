variable "project" {
  type    = string
  default = "roboshop"
}

variable "domain" {
  default = "yanvisol.online"
}

variable "environment" {
  default = "DEV"
}

variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "ami-id" {
  default = "ami-0055977a6e828a4f4"
}

variable "instanceType" {
  default = "t3.micro"
}

variable "zoneid" {
  default = "Z0688498SMD7ZAD1RR0B"
}

variable "ports" {
  type    = list
  default = [27017, 6379, 3306, 5672, 8080, 8080, 8080, 8080, 8080, 80]
}
