resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.mongodb_ip.value]
}

resource "aws_route53_record" "web" {
  zone_id = var.zone_id
  name    = "${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.web_ip.value]
}

resource "aws_route53_record" "user" {
  zone_id = var.zone_id
  name    = "user.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.user_ip.value]
}

resource "aws_route53_record" "catalogue" {
  zone_id = var.zone_id
  name    = "catalogue.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.catalogue_ip.value]
}

resource "aws_route53_record" "cart" {
  zone_id = var.zone_id
  name    = "cart.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.cart_ip.value]
}

resource "aws_route53_record" "shipping" {
  zone_id = var.zone_id
  name    = "shipping.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.shipping_ip.value]
}

resource "aws_route53_record" "payment" {
  zone_id = var.zone_id
  name    = "payment.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.payment_ip.value]
}

resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.redis_ip.value]
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = var.zone_id
  name    = "rabbitmq.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.rabbitmq_ip.value]
}

resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql.${var.domain}"
  type    = "A"
  ttl     = 10
  records = [data.aws_ssm_parameter.mysql_ip.value]
}