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

variable "user_data" {
  default = {}
}

variable "zone_id" {
  default = "Z04792653IEF9CCFF0L9J"
}

variable "domain" {
  default = "challa.cloud"
}

variable "component" {
  default = "app-alb"
}