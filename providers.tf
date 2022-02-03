terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.34.0,<=3.37.0"
    }
  }
}
provider "aws" {
  region     = "us-east-2"
  profile = "default"
}
