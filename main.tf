terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1" # Change as needed
}

terraform {
  backend "s3" {
    bucket = "jenkins-terraform-state-7297"
    key    = "tfstate"
    region = "us-east-1"
  }

}
# Create IAM User

resource "aws_iam_user" "terraform_user" {
  name = "terraform"
}

