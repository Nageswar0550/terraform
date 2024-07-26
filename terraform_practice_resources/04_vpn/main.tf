module "roboshop_vpn" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  environment = var.environment
  project_name = var.project_name
  component = "vpn"
  ami_id = data.aws_ami.ami.id
  subnet_id = data.aws_subnet.default.id
  vpc_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  user_data = file("openvpn.sh")
}