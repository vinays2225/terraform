locals {
    instance_type = var.instance_type
    project = var.project
    region = var.region
    environment = var.environment
    name = "${var.project}-${var.environment}-local-demo"
    common_tags = {
        Name        = var.project
        Environment = var.environment
        Project     = var.project
        Terraform   = "true"
    }

    tags = merge(
        local.common_tags,
        {
            Name = local.name
        }
    )
}