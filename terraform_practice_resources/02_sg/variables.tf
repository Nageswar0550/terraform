variable "common_tags" {
  default = {
    environment = "Dev"
    project_name = "Roboshop"
    terraform = true
  }
}

variable "sg_description" {
  type = string
  default = "security_group_for"
}

variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "instance_names" {
  type = list
  default = ["web","mongodb","user","cart","catalogue","redis","mysql","rabbitmq","payment","shipping","vpn"]
}

variable "security_group_tags" {
  default = {}
}