terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"  # Change as needed
}

# Create IAM User

resource "aws_iam_user" "terraform_user" {
  name = "terraform"
}

