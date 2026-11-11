resource "aws_instance" "local-demo"{
    instance_type = local.instance_type
    ami           = data.aws_ami.datasource-ami.id
    tags          = local.tags
    vpc_security_group_ids = [aws_security_group.local-demo.id]
}


resource "aws_security_group" "local-demo" {
    name        = "${local.name}-sg"
    description = "Security group for ${local.name}"
    

    ingress {
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
