data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${local.name}/catalogue/sg_id"
}

data "aws_ssm_parameter" "roboshop_vpc" {
  name = "/${local.name}/vpc_id"
}