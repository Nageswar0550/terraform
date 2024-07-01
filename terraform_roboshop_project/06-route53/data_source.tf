data "aws_ssm_parameter" "web_ip" {
  name = "/${local.name}/web/public_ip"
}

data "aws_ssm_parameter" "mongodb_ip" {
  name = "/${local.name}/mongodb/private_ip"
}

data "aws_ssm_parameter" "mysql_ip" {
  name = "/${local.name}/mysql/private_ip"
}

data "aws_ssm_parameter" "redis_ip" {
  name = "/${local.name}/redis/private_ip"
}

data "aws_ssm_parameter" "rabbitmq_ip" {
  name = "/${local.name}/rabbitmq/private_ip"
}

data "aws_ssm_parameter" "cart_ip" {
  name = "/${local.name}/cart/private_ip"
}

data "aws_ssm_parameter" "catalogue_ip" {
  name = "/${local.name}/catalogue/private_ip"
}

data "aws_ssm_parameter" "user_ip" {
  name = "/${local.name}/user/private_ip"
}

data "aws_ssm_parameter" "payment_ip" {
  name = "/${local.name}/payment/private_ip"
}

data "aws_ssm_parameter" "shipping_ip" {
  name = "/${local.name}/shipping/private_ip"
}