resource "aws_route53_record" "roboshop" {
  count   = length(var.instances)
  name    = "${var.instances[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  zone_id = "${var.zoneid}"
  records = [aws_instance.roboshop[count.index].private_ip]
}


resource "aws_route53_record" "frontend" {
  count   = contains(var.instances, "frontend") ? 1 : 0
  name    = "${var.domain}"
  type    = "A"
  ttl     = 1
  zone_id = "${var.zoneid}"
  records = [aws_instance.roboshop[index(var.instances, "frontend")].public_ip]
  allow_overwrite = true
}

