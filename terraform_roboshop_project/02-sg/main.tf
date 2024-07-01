module "roboshop_sg" {
  source = "../../terraform_aws_sg_module"
  sg_name = var.sg_name
  sg_description = var.sg_description
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}