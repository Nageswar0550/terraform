module "roboshop_vpc" {
  source = "../../terraform_practice_modules/01_vpc_module"
  project_name = var.project_name
  environment = var.environment
  is_peering_required = true
}