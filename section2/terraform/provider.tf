terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "project1/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0" # sets terraform CLI version
}

# Configure the AWS Provider
provider "aws" {
  alias  = "default"
  region = "ap-southeast-1"
}
