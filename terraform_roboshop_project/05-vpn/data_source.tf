data "aws_ami" "ami" {
  owners = [ "973714476881" ]
  most_recent = true

  filter {
    name = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/vpn/sg_id"
}
