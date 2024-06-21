terraform {
    backend "s3" {
        bucket = "challa-rao-backend"
        key    = "backend"
        region = "us-east-1"
        dynamodb_table = "challa-rao"
    }
}