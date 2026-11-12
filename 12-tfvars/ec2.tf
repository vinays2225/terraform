resource "aws_instance" "tfvars-demo" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.ami-id.id
  vpc_security_group_ids = []

  tags = var.common-tags

}

resource "aws_security_group" "tfvars-demo-sg" {
  name        = "tfvars-demo-sg-${var.environment}"
  description = "Allow connections"

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

  tags = var.common-tags
}