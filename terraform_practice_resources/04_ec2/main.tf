module "mongodb" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
  subnet_id = local.database_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "mongodb"
}

module "mysql" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
  subnet_id = local.database_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "mysql"
}

module "redis" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.redis_sg_id.value
  subnet_id = local.database_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "redis"
}

module "rabbitmq" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
  subnet_id = local.database_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "rabbitmq"
}

module "catalogue" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
  subnet_id = local.private_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "catalogue"
}

module "cart" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
  subnet_id = local.private_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "cart"
}

module "user" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  subnet_id = local.private_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "user"
}

module "shipping" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  subnet_id = local.private_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "shipping"
}

module "web" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.web_sg_id.value
  subnet_id = local.public_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "web"
}

module "payment" {
  source = "../../terraform_practice_modules/04_ec2"
  instance_type = "t2.micro"
  ami_id = data.aws_ami.ami.id
  vpc_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
  subnet_id = local.private_subnet_id
  project_name = var.project_name
  instance_names = var.instance_names
  environment = var.environment
  component = "payment"
  }