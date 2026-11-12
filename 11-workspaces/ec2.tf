resource "aws_instance" "workspace-demo" {
    instance_type = lookup(var.instance_types,terraform.workspace)
    ami = data.aws_ami.ami-id.id

    vpc_security_group_ids = [aws_security_group.workspace-demo-sg.id]
    

    tags = local.local_tags

}

resource "aws_security_group" "workspace-demo-sg" {
  name = "workspace-demo"
  description = "Aloow remote connections"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = local.local_tags

}