/*  1. name  
    2. instance type
    3. ami
    4. keypair
    5. SG
       
*/

resource "aws_instance" "terraform-ec2" {
    instance_type = "t3.micro"
    ami = "ami-0055977a6e828a4f4"
    vpc_security_group_ids = [aws_security_group.terraform-common.id]
    tags = {
        name = "terraform-ec2"    
    }
}


# Security group cresation

resource "aws_security_group" "terraform-common" {
    name = "terraform-common"
    description = "Allow remote michaine"

    tags ={
        name = "terraform-common"
    }
}



# 4. Outbound Rule: Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.terraform-common.id
  cidr_ipv4         = ["0.0.0.0/0"]
  ip_protocol       = "-1" # "-1" means all protocols and ports
}


# 4. Inbound Rule: Allow all Inbound traffic
resource "aws_vpc_security_group_ingress_rule" "allow_all_Inbound" {
  security_group_id = aws_security_group.terraform-common.id
  cidr_ipv4         = ["0.0.0.0/0"]
  ip_protocol       = "tcp"
  from_port = 22
  to_port = 22
}