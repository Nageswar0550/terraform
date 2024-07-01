variable "sg_name" {
  type = list
  default = ["web","mongodb","user","cart","catalogue","redis","mysql","rabbitmq","payment","shipping","vpn"]
}

variable "sg_description" {
  type = string
  default = "security_group_for"
}

variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "common_tags" {
  default = {
    Terraform = "true"
  }
}