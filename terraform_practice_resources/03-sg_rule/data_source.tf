data "aws_ssm_parameter" "web_sg_id" {
  name = "/${var.project_name}/${var.environment}/web/sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.environment}/mongodb/sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project_name}/${var.environment}/catalogue/sg_id"
}

data "aws_ssm_parameter" "cart_sg_id" {
  name = "/${var.project_name}/${var.environment}/cart/sg_id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project_name}/${var.environment}/user/sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.environment}/mysql/sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project_name}/${var.environment}/redis/sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project_name}/${var.environment}/rabbitmq/sg_id"
}

data "aws_ssm_parameter" "payment_sg_id" {
  name = "/${var.project_name}/${var.environment}/payment/sg_id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name = "/${var.project_name}/${var.environment}/shipping/sg_id"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/vpn/sg_id"
}

data "aws_ssm_parameter" "app_alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/app_alb/sg_id"
}