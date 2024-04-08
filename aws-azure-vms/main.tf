terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.98.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "wermessonfacundo01"
    container_name       = "remote-state"
    key                  = "pipeline-gitlab/terraform.tfstate"
  }
}
provider "aws" {

  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "Wermessonfacundo"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "wermessonfacundo-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "wermessonfacundo01"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}