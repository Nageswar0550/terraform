module "mongodb" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.mongodb_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = var.component
}

module "mysql" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.mysql_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "mysql"
}

module "rabbitmq" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.rabbitmq_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "rabbitmq"
}

module "redis" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.redis_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "redis"
}

module "web" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.public_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.web_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "web"
}

module "catalogue" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.catalogue_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "catalogue"
}

module "cart" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.cart_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "cart"
}

module "user" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.user_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "user"
}

module "shipping" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.shipping_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "shipping"
}

module "payment" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = data.aws_ssm_parameter.payment_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "payment"
}

module "ansible" {
  source = "../../terraform_aws_ec2_module"
  aws_ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.default.id
  vpc_security_group_ids = data.aws_ssm_parameter.vpn_sg_id.value
  environment = var.environment
  project_name = var.project_name
  common_tags = var.common_tags
  component = "ansible_server"
  user_data = file("ansible.sh")
}