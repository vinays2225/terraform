resource "aws_security_group" "robo-sg" {
    name = "${var.project}-${var.environment}-sg"
    description = "Allow connections from remote."

  dynamic "ingress" {
    for_each = var.sg-ingress 
     content {      
        from_port = ingress.value.from
        to_port = ingress.value.to
        protocol = ingress.key
        cidr_blocks = ingress.value.cidr_blocks
     }
    }
}