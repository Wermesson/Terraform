terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "WermessonFacundo"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  alias                      = "azurepro"
  skip_provider_registration = true
  features {

  }
}