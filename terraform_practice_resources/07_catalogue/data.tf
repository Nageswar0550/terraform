data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${local.name}/catalogue/sg_id"
}

data "aws_ssm_parameter" "roboshop_vpc" {
  name = "/${local.name}/vpc_id"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "ami" {
  most_recent = true
  owners = ["973714476881"]

  filter {
    name = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${local.name}/private_subnet_id"
}

data "aws_ssm_parameter" "listener_arn" {
  name = "/${local.name}/listener_arn"
}