terraform {
  backend "s3" {
    bucket = "challa-rao-backend"
    key = "roboshop_vpc_2"
    region = "us-east-1"
    dynamodb_table = "challa-rao"
  }
}