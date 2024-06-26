module "roboshop_vpc" {
  source       = "../terraform_aws_vpc_module"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  environment  = var.environment
  common_tags  = var.common_tags

  public_subnet_cidr_block = var.public_subnet_cidr_block

  private_subnet_cidr_block = var.private_subnet_cidr_block

  database_subnet_cidr_block = var.database_subnet_cidr_block
}