module "roboshop_2" {
  source = "../terraform_practice_2_vpc_module"
  project_name = "roboshop"
  environment = "dev"
  deploy_in_az = "2"
}