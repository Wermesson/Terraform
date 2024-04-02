terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.43.0"
    }
  }

  backend "s3" {
    bucket = "wermessonfacundo-remote-state"
    key    = "aws-teste-2/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  default_tags {
    tags = {
      owner      = "WermessonFacundo"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "rs_state" {
  backend = "s3"
  config = {
    bucket = "wermessonfacundo-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}