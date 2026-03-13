terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
  backend "s3" {
    bucket = "awscourse-s3-288757602165-us-east-1-an"
    key    = "eks-lab/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
