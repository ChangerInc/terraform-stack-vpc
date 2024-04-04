locals {
  additional_tags = merge(
    var.override_additional_tags,
    {
      managed_by  = "Terraform"
      environment = "prod"
    }
  )
}