resource "aws_lb" "test" {
  name               = "${var.project_name}-${var.environment}-${var.component}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.alb_sg_id.value]
  subnets            = split(",",data.aws_ssm_parameter.private_subnet_id.value)
  tags = merge(
    var.common_tags,
    var.ec2_tags,
    {
      Name = "${var.project_name}-${var.environment}-${var.component}"
    }
  )
}

resource "aws_lb_listener" "app_alb" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi Team, I am from APP_ALB"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "*.app-${var.environment}.${var.domain}"
  type    = "A"
  #ttl     = 10
  alias {
    name    = aws_lb.test.dns_name
    zone_id = aws_lb.test.zone_id
    evaluate_target_health = true
  }
}