resource "aws_ssm_parameter" "vpc_id" {
  type = "String"
  name = "/${var.project_name}/${var.environment}/vpc_id"
  value = aws_vpc.main.id
}