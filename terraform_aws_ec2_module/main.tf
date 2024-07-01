resource "aws_instance" "main" {
  #instance_type = var.instance_type_public
  ami = var.aws_ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  user_data = var.user_data

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-${var.component}"
    }
  )
}