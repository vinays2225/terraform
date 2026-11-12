locals {
  project     = "Roboshop"
  environment = terraform.workspace
  local_tags = merge(var.common-tags, {
    Name = "${local.project}-${local.environment}"
    },
  {})
}