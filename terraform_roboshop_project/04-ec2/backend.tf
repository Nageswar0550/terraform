terraform {
  backend "s3" {
    bucket         = "challa-rao-backend"
    key            = "roboshop_project_ec2"
    region         = "us-east-1"
    dynamodb_table = "challa-rao"
  }
}