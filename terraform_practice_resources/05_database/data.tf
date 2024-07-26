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

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.environment}/mongodb/sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project_name}/${var.environment}/redis/sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project_name}/${var.environment}/rabbitmq/sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.environment}/mysql/sg_id"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/vpn/sg_id"
}

data "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.project_name}/${var.environment}/database_subnet_id"
}

