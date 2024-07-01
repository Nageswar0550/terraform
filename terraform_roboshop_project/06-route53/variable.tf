variable "zone_id" {
  default = "Z04705771WF26JT19EK50"
  type = string
}

variable "domain" {
  type = string
  default = "challa.cloud"
}

variable "instance_name" {
  type = list
  default = ["web","mongodb","user","cart","catalogue","redis","mysql","rabbitmq","payment","shipping"]
}

variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}