resource "aws_instance" "provisioner-demo" {
  instance_type = "t3.micro"
  ami           = "ami-0055977a6e828a4f4"

  vpc_security_group_ids = [aws_security_group.provisioner-sg.id]

  tags = {
    Name = "provisioner-demo"
  }

  provisioner "local-exec" {
    command = "echo Instance created."
  }

  provisioner "local-exec" {

    command = "pwd" # > inventory.ini
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo instance destroyed."
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  # provisioner "remote-exec" {
  #     inline = [ 
  #         "sudo dnf install nginx -y",
  #         "sudo systemctl start nginx",
  #         "sudo systemctl enable nginx"
  #      ]

  # }

  provisioner "remote-exec" {
    inline = [
      "rm  -f /tmp/bootstrap.sh"
    ]
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
    ]
  }
  provisioner "remote-exec" {
   inline = ["echo installed nginx"]
  }
  provisioner "remote-exec" {
    when   = destroy
    inline = ["sudo systemctl stop nginx"]
  }

}

resource "aws_security_group" "provisioner-sg" {
  name        = "provisioner-sg"
  description = "Provisioner allow"

  tags = {
    Name = "Provioner-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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