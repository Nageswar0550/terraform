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

variable "instance_names" {
  type = list
  default = ["web","mongodb","user","cart","catalogue","redis","mysql","rabbitmq","payment","shipping","vpn"]
}


variable "ec2_tags" {
  default = {}
}
