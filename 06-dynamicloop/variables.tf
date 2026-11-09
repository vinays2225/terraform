variable "project" {
    default = "roboshop"
}


variable "environment" {
    default = "Dev"
}

variable "instances" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq"]
}

variable "sg-ingress" {
    default  = {
        ssh = {
            from = 22
            to = 22
            cidr_blocks = ["0.0.0.0/0"]
        }
        http = {
            from = 80
            to = 80
            cidr_blocks = ["0.0.0.0/0"]
        }
        tcp = {
            from = 8081
            to = 8081
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}