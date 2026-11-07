resource "aws_instance" "expense-ec2" {
    instance_type = var.instance_type
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.expense-common.id]
    tags = {
        name = "expense-ec2"
    } 

}

resource "aws_security_group" "expense-common" {
        name = "expense-common"
        description = "Allow remote connections."

}

# inbound rules 
resource "aws_vpc_security_group_ingress_rule" "allow_ssh"  {
    security_group_id = aws_security_group.expense-common.id
    from_port = var.from_port
    to_port = var.to_port
    ip_protocol = "tcp"
    cidr_ipv4 = var.cidr_ipv4
}

# Outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound"  {
    security_group_id = aws_security_group.expense-common.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
}


