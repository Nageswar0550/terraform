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
  iam_instance_profile = "Full_access_to_EC2_and_Route53"
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
  iam_instance_profile = "Full_access_to_EC2_and_Route53"
}

resource "null_resource" "mongodb" {
  triggers = {
    id = "module.mongodb.id"
  }
  connection {
    host = module.mongodb.private_ip
    type = "ssh"
    user = "centos"
    password = "DevOps321"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb dev"
    ]
  }
}

resource "null_resource" "redis" {
  triggers = {
    id = "module.redis.id"
  }
  connection {
    host = module.redis.private_ip
    type = "ssh"
    user = "centos"
    password = "DevOps321"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh redis dev"
    ]
  }
}

resource "null_resource" "rabbitmq" {
  triggers = {
    id = "module.rabbitmq.id"
  }
  connection {
    host = module.rabbitmq.private_ip
    type = "ssh"
    user = "centos"
    password = "DevOps321"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh rabbitmq dev"
    ]
  }
}

resource "null_resource" "mysql" {
  triggers = {
    id = "module.mysql.id"
  }
  connection {
    host = module.mysql.private_ip
    type = "ssh"
    user = "centos"
    password = "DevOps321"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql dev"
    ]
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [module.mongodb.private_ip]
}

resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [module.redis.private_ip]
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = var.zone_id
  name    = "rabbitmq-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [module.rabbitmq.private_ip]
}

resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [module.mysql.private_ip]
}

# module "mysql" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
#   subnet_id = local.database_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "mysql"
# }

# module "redis" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.redis_sg_id.value
#   subnet_id = local.database_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "redis"
# }

# module "rabbitmq" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
#   subnet_id = local.database_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "rabbitmq"
# }

# module "catalogue" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
#   subnet_id = local.private_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "catalogue"
# }

# module "cart" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
#   subnet_id = local.private_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "cart"
# }

# module "user" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.user_sg_id.value
#   subnet_id = local.private_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "user"
# }

# module "shipping" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.user_sg_id.value
#   subnet_id = local.private_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "shipping"
# }

# module "web" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.web_sg_id.value
#   subnet_id = local.public_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "web"
# }

# module "payment" {
#   source = "../../terraform_practice_modules/04_ec2"
#   instance_type = "t2.micro"
#   ami_id = data.aws_ami.ami.id
#   vpc_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
#   subnet_id = local.private_subnet_id
#   project_name = var.project_name
#   instance_names = var.instance_names
#   environment = var.environment
#   component = "payment"
#   }