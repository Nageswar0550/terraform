module "ansible" {
  source = "../../terraform_practice_modules/04_ec2"
  environment = var.environment
  project_name = var.project_name
  instance_type = "t2.micro"
  component = "ansible"
  subnet_id = data.aws_subnet.default.id
  vpc_security_group_id = data.aws_ssm_parameter.ansible_sg_id.value
  user_data = file("ansible.sh")
  ami_id = data.aws_ami.ami.id
}