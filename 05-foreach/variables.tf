variable "environment" {
    default = "Dev"
}

variable "project" {
    default = "roboshop"
}

variable "ami_id" {
    default = "ami-0055977a6e828a4f4"
}

variable "instances" {
    type = map 
    default = {
       mangodb = {
        instance_type = "t3.micro"
        port_no  = 27017
       }
       redis = {
        instance_type = "t3.micro"
        port_no = 6379
       } 
       mysql = {
        instance_type = "t3.small"
        port_no = 3306
       }

       rabbitmq = {
        instance_type = "t3.micro"
        port_no = 5672
       } 

       catalogue = {
        instance_type = "t3.micro"
        port_no  = 8080
       }
       user = {
        instance_type = "t3.micro"
        port_no = 8080
       } 
       cart = {
        instance_type = "t3.small"
        port_no = 8080
       }

       shipping = {
        instance_type = "t3.micro"
        port_no = 8080
       } 
    
        payment = {
        instance_type = "t3.small"
        port_no = 8080
       }

    }
}
