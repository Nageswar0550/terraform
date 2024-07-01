resource "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
  type = "String"
  value = "${module.roboshop_vpc.vpc_id}"
}

resource "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project_name}/${var.environment}/public_subnet_id"
  type = "StringList"
  value = join(",","${module.roboshop_vpc.public_subnet_id[*]}")
}

resource "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.project_name}/${var.environment}/private_subnet_id"
  type = "StringList"
  value = join(",","${module.roboshop_vpc.private_subnet_id[*]}")
}

resource "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.project_name}/${var.environment}/database_subnet_id"
  type = "StringList"
  value = join(",","${module.roboshop_vpc.database_subnet_id[*]}")
}