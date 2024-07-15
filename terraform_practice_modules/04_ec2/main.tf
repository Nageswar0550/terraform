resource "aws_instance" "main" {
  instance_type = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_id]
  ami = var.ami_id
  subnet_id = var.subnet_id

   tags = merge(
    var.common_tags,
    var.ec2_tags,
    {
      Name = "${local.name}-${var.component}"
    }
  )
}