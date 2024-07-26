variable "common_tags" {
  default = {
    environment = "Dev"
    project_name = "Roboshop"
    terraform = true
  }
}

variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "ec2_tags" {
  default = {}
}

variable "instance_names" {
  default = []
}

variable "component" {
  default = "catalogue"
}

variable "domain" {
  default = "challa.cloud"
}