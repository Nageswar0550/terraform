resource "aws_lb_target_group" "catalogue_ami" {
  name     = "${local.name}-${var.component}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_ssm_parameter.roboshop_vpc.id
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

module "catalogue_ami" {
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

resource "null_resource" "catalogue_ami" {
  triggers = {
    id = "module.catalogue_ami.id"
  }
  connection {
    host = module.catalogue_ami.private_ip
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

resource "aws_ec2_instance_state" "catalogue_ami" {
  instance_id = module.catalogue_ami.id
  state       = "stopped"
  depends_on = [ null_resource.catalogue_ami ]
}

resource "aws_ami_from_instance" "catalogue_ami" {
  name               = "${component}-${environment}-local.time"
  source_instance_id = module.catalogue_ami.id
  depends_on = [ aws_ec2_instance_state.catalogue_ami ]
}

resource "null_resource" "catalogue_delete" {
  triggers = {
    instance_id = module.catalogue.id
  }

  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${module.catalogue_ami.id}"
  }

  depends_on = [ aws_ami_from_instance.catalogue_ami ]
}

resource "aws_launch_template" "foo" {
  name = "catalogue"
  image_id = aws_ami_from_instance.catalogue_ami.id

  vpc_security_group_ids = element(split(",", data.aws_ssm_parameter.catalogue_sg_id), 0)

    tags = merge(
    var.common_tags,
    var.ec2_tags,
    {
      Name = "${var.project_name}-${var.environment}-${var.component}"
    }
  )
}