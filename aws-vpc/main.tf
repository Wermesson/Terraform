terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }

  backend "s3" {
    bucket = "wermessonfacundo-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
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