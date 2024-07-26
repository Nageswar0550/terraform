terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
  backend "s3" {
    bucket         = "challa-rao-backend-2"
    key            = "terraform_practice_catalogue_module"
    region         = "us-east-1"
    dynamodb_table = "challa-rao"
  }
}