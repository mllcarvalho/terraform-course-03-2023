terraform {

  /*backend "s3" {
    bucket         = "terraform-remote-backend-ACCOUNT_ID"
    key            = "terraform/tfstate/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-dynamo-state-lock"
  }*/

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
