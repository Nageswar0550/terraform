module "ansible" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.default.id
  vpc_security_group_ids = data.aws_ssm_parameter.vpn_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = var.component
  user_data = file("ansible.sh")
}