data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_vpc" "roboshop_vpc" {
  cidr_block = "10.0.0.0/16"
}