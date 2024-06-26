terraform {
  required_version = ">= 1.7.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner      = var.owner
      managed-by = "terraform"
    }
  }
}