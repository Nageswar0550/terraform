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

data "aws_subnet" "default" {
  availability_zone = "us-east-1a"
  vpc_id = data.aws_vpc.default.id
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project_name}/${var.environment}/public_subnet_id"
}

data "aws_ssm_parameter" "vpn_sg_id"{
  name = "/${var.project_name}/${var.environment}/vpn/sg_id"
}