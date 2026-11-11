resource "aws_instance" "datasource-demo" {
    instance_type = var.instance_type
    ami = data.aws_ami.datasource-ami.id
    vpc_security_group_ids = [aws_security_group.datasource-demo.id]

    tags={
        Name = "${var.project}-instance"
    }

}


resource "aws_security_group" "datasource-demo" {
    name = "${var.project}-sg"
    description = "Demo security group for data source"

    ingress {
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

    tags = {
        Name = "${var.project}-sg"
    }
}