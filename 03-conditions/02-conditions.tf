resource "aws_instance" "ec2-condions" {
    instance_type = var.environment == "Dev" ? "t3.micro" : "t3.larg"
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.condions-common.id]

    tags = {
        Name = "ec2-condions"
    }


}

resource "aws_security_group" "condions-common" {
    name = "condions-common"
    description = "Allow remote connections"

    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


}