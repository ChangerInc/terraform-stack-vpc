terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      version = ">= 3.73.0"
      source  = "hashicorp/aws"
    }
  }
}