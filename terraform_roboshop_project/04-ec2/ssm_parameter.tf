resource "aws_ssm_parameter" "web_ip" {
  name = "/${local.name}/web/public_ip"
  value = module.web.public_ip
  type = "String"
}

resource "aws_ssm_parameter" "mongodb_ip" {
  name = "/${local.name}/mongodb/private_ip"
  value = module.web.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "mysql_ip" {
  name = "/${local.name}/mysql/private_ip"
  value = module.mysql.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "redis_ip" {
  name = "/${local.name}/redis/private_ip"
  value = module.redis.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "rabbitmq_ip" {
  name = "/${local.name}/rabbitmq/private_ip"
  value = module.rabbitmq.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "cart_ip" {
  name = "/${local.name}/cart/private_ip"
  value = module.cart.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "catalogue_ip" {
  name = "/${local.name}/catalogue/private_ip"
  value = module.catalogue.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "user_ip" {
  name = "/${local.name}/user/private_ip"
  value = module.user.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "payment_ip" {
  name = "/${local.name}/payment/private_ip"
  value = module.payment.private_ip
  type = "String"
}

resource "aws_ssm_parameter" "shipping_ip" {
  name = "/${local.name}/shipping/private_ip"
  value = module.shipping.private_ip
  type = "String"
}