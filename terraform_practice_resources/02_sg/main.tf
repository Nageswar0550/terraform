module "roboshop_sg" {
  source = "../../terraform_practice_modules/02_sg_module"
  instance_names = var.instance_names
  project_name = var.project_name
  environment = var.environment
  sg_description = var.sg_description
}