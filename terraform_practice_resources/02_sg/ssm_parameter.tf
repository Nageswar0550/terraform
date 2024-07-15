resource "aws_ssm_parameter" "sg_id" {
  count = length("${var.instance_names}")
  name = "/${var.project_name}/${var.environment}/${var.instance_names[count.index]}/sg_id"
  type = "String"
  value = "${module.roboshop_sg.sg_id[count.index]}"
}