resource "aws_ssm_parameter" "sg_id" {
  count = length("${var.sg_name}")
  name = "/${var.project_name}/${var.environment}/${var.sg_name[count.index]}/sg_id"
  type = "String"
  value = "${module.roboshop_sg.sg_id[count.index]}"
}