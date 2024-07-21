resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}

resource "aws_security_group_rule" "catalogue_cart" {
  source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}

resource "aws_security_group_rule" "user_payment" {
  source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}

resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

resource "aws_security_group_rule" "cart_payment" {
  source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

resource "aws_security_group_rule" "app_alb_catalogue" {
  source_security_group_id = data.aws_ssm_parameter.app_alb_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}

resource "aws_security_group_rule" "app_alb_cart" {
  source_security_group_id = data.aws_ssm_parameter.app_alb_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

resource "aws_security_group_rule" "app_alb_user" {
  source_security_group_id = data.aws_ssm_parameter.app_alb_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}

resource "aws_security_group_rule" "app_alb_shipping" {
  source_security_group_id = data.aws_ssm_parameter.app_alb_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
}

resource "aws_security_group_rule" "app_alb_payment" {
  source_security_group_id = data.aws_ssm_parameter.app_alb_sg_id.value
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
}

# resource "aws_security_group_rule" "web_catalogue" {
#   source_security_group_id = data.aws_ssm_parameter.web_sg_id.value
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# }

# resource "aws_security_group_rule" "web_cart" {
#   source_security_group_id = data.aws_ssm_parameter.web_sg_id.value
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# }

# resource "aws_security_group_rule" "web_user" {
#   source_security_group_id = data.aws_ssm_parameter.web_sg_id.value
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = data.aws_ssm_parameter.user_sg_id.value
# }

# resource "aws_security_group_rule" "web_shipping" {
#   source_security_group_id = data.aws_ssm_parameter.web_sg_id.value
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
# }

# resource "aws_security_group_rule" "web_payment" {
#   source_security_group_id = data.aws_ssm_parameter.web_sg_id.value
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# }

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = data.aws_ssm_parameter.web_sg_id.value
}

resource "aws_security_group_rule" "internet_vpn" {
  cidr_blocks = ["0.0.0.0/0"]
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
}

resource "aws_security_group_rule" "vpn_web" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.web_sg_id.value
}

resource "aws_security_group_rule" "vpn_catalogue" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}

resource "aws_security_group_rule" "vpn_cart" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

resource "aws_security_group_rule" "vpn_user" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}

resource "aws_security_group_rule" "vpn_payment" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
}

resource "aws_security_group_rule" "vpn_shipping" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
}

resource "aws_security_group_rule" "vpn_mongodb" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

resource "aws_security_group_rule" "vpn_redis" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

resource "aws_security_group_rule" "vpn_rabbitmq" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}

resource "aws_security_group_rule" "vpn_mysql" {
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}