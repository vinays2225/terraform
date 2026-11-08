resource "aws_instance" "roboshop" {
  count         = length(var.instances)
  instance_type = var.instanceType
  ami           = var.ami-id
  vpc_security_group_ids = [
    aws_security_group.roboshop-sg[count.index].id,
    aws_security_group.common.id
  ]

  tags = {
    Name = "${var.environment}-${var.project}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "common" {
  
  name        = "${var.project}-${var.environment}-common"
  description = "Allow remote connections from othe instances"

  ingress {
    description = "Allow HTTPS"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_security_group" "roboshop-sg" {
  count       = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "Allow remote connections from othe instances"
  ingress {
    description = "Allow tcp"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}