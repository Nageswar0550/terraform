resource "aws_lb_target_group" "catalogue" {
  name     = "${var.project_name}-${var.environment}-${var.component}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_ssm_parameter.roboshop_vpc.value
  deregistration_delay = 60
  health_check {
    healthy_threshold   = 2
    interval            = 10
    unhealthy_threshold = 3
    timeout             = 5
    path                = "/health"
    port                = 8080
    matcher = "200-299"
  }
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
  component = "${var.component}"
  iam_instance_profile = "Full_access_to_EC2_and_Route53"
}

resource "null_resource" "catalogue" {
  triggers = {
    id = module.catalogue.id
  }
  connection {
    host = module.catalogue.private_ip
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
      "sudo sh /tmp/bootstrap.sh catalogue dev"
    ]
  }
}

resource "aws_ec2_instance_state" "catalogue" {
  instance_id = module.catalogue.id
  state       = "stopped"
  depends_on = [ null_resource.catalogue ]
}

resource "aws_ami_from_instance" "catalogue" {
  name               = "${var.component}-${var.environment}-local.time"
  source_instance_id = module.catalogue.id
  depends_on = [ aws_ec2_instance_state.catalogue ]
}

resource "null_resource" "catalogue_delete" {
  triggers = {
    instance_id = module.catalogue.id
  }

  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${module.catalogue.id}"
  }

  depends_on = [ aws_ami_from_instance.catalogue ]
}

resource "aws_launch_template" "catalogue" {
  name = "catalogue"
  image_id = aws_ami_from_instance.catalogue.id
  instance_type = "t2.micro"
  update_default_version = true
  instance_initiated_shutdown_behavior = "terminate"
  vpc_security_group_ids = [ element(split(",", data.aws_ssm_parameter.catalogue_sg_id.value),0) ]

    tags = merge(
    var.common_tags,
    var.ec2_tags,
    {
      Name = "${var.project_name}-${var.environment}-${var.component}"
    }
  )
}

resource "aws_autoscaling_group" "catalogue" {
  name                      = "${var.project_name}-${var.environment}-${var.component}"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_template {
    name = aws_launch_template.catalogue.name
  }
  vpc_zone_identifier       = [data.aws_ssm_parameter.private_subnet_id.value]

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-${var.component}"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }
}

resource "aws_lb_listener_rule" "catalogue" {
  listener_arn = data.aws_ssm_parameter.listener_arn.value
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.catalogue.arn
  }

  condition {
    host_header {
      values = ["${var.component}.app-${var.environment}.${var.domain}"]
    }
  }
}

resource "aws_autoscaling_policy" "catalogue" {
  autoscaling_group_name = aws_autoscaling_group.catalogue.name
  name                   = "${var.project_name}-${var.environment}-${var.component}"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}