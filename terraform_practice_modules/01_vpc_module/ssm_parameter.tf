resource "aws_ssm_parameter" "vpc_id" {
  type = "String"
  name = "/${var.project_name}/${var.environment}/vpc_id"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_subnet_id" {
  type = "StringList"
  name = "/${var.project_name}/${var.environment}/private_subnet_id"
  value = join(",","${aws_subnet.private_main[*].id}")
}

resource "aws_ssm_parameter" "public_subnet_id" {
  type = "StringList"
  name = "/${var.project_name}/${var.environment}/public_subnet_id"
  value = join(",","${aws_subnet.public_main[*].id}")
}

resource "aws_ssm_parameter" "database_subnet_id" {
  type = "StringList"
  name = "/${var.project_name}/${var.environment}/database_subnet_id"
  value = join(",","${aws_subnet.database_main[*].id}")
}