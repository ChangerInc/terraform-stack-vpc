variable "access_key_id" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = "shd"
}

variable "override_additional_tags" {
  description = "(Optional) Values to override or add to every resource's tags, can be fully or partially replaced."
  type        = map(string)
  nullable    = false
  default = {
    managed_by  = "Terraform"
    environment = "shd"
  }
}