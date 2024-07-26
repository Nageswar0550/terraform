resource "aws_security_group" "main" {
  count = length(var.instance_names)
  description = "${var.sg_description}-${var.instance_names[count.index]}"
  name = "${local.name}-${var.instance_names[count.index]}"
  vpc_id = var.instance_names[count.index] == "vpn" ? data.aws_vpc.default.id: data.aws_ssm_parameter.vpc_id.value
  tags = merge(
    var.common_tags,
    var.security_group_tags,
    {
      Name = "${local.name}-${var.instance_names[count.index]}"
    }
  )

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}