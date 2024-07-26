terraform {
  backend "s3" {
    bucket         = "challa-rao-backend"
    key            = "roboshop_project_sg_rule"
    region         = "us-east-1"
    dynamodb_table = "challa-rao"
  }
}