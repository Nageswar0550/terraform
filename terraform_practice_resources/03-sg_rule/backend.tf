terraform {
  backend "s3" {
    bucket         = "challa-rao-backend-2"
    key            = "roboshop_project_sg_rule"
    region         = "us-east-1"
    dynamodb_table = "challa-rao"
  }
}