resource "aws_instance" "roboshop" {
    for_each = var.instances
    instance_type = each.value.instance_type
    ami = var.ami_id

    vpc_security_group_ids =[aws_security_group.roboshop-common.id,
                            aws_security_group.roboshop-sg[each.key].id]

    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}

resource "aws_security_group" "roboshop-common" {

    name = "${var.project}-${var.environment}-common"
    description = "Allow remote connection"

    tags = {
         Name = "${var.project}-${var.environment}-common"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "roboshop-sg" {
    for_each = var.instances
    name = "${var.project}-${var.environment}-${each.key}"
    description = "Allow coonection to ${each.key}"
    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }

    ingress {
        from_port = each.value.port_no
        to_port =  each.value.port_no
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}