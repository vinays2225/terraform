resource "aws_instance" "main"{
    instance_type = var.instance_type
    ami = data.aws_ami.main.id
    vpc_security_group_ids = var.security-groups

    tags = merge(
        var.ec2-tags,
        local.common-tags,
        {
            Name="${var.project}-${var.environment}-${var.component}"
        }
    )

}