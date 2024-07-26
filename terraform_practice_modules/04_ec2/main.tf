resource "aws_instance" "main" {
  instance_type = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_id]
  ami = var.ami_id
  user_data = var.user_data
  subnet_id = var.subnet_id
  iam_instance_profile = var.iam_instance_profile

   tags = merge(
    var.common_tags,
    var.ec2_tags,
    {
      Name = "${local.name}-${var.component}"
    }
  )
}