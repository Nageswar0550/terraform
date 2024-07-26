locals {
  #database_subnet_id = element(split(",",data.aws_ssm_parameter.database_subnet_id.value),0)
  # public_subnet_id = element(split(",",data.aws_ssm_parameter.public_subnet_id.value),0)
  private_subnet_id = element(split(",",data.aws_ssm_parameter.private_subnet_id.value),0)
  name = "${var.project_name}/${var.environment}"
  time = formatdate(YYYY-MM-DD-hh-mm, timestamp)
}
