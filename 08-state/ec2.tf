resource "aws_instance" "demo-sate" {
    ami           = data.aws_ami.demo-sate.id
    instance_type = var.instance_type
    tags = {
        Name = var.project
    }

    vpc_security_group_ids = [aws_security_group.demo-sate.id]


}

resource "aws_security_group" "demo-sate" {
    name        = var.project
    description = "Allow SSH and HTTP inbound traffic"
   
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}   