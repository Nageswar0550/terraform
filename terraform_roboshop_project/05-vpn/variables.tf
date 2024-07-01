variable "instance_type" {
  type = string
  default = "t2.micro"
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

variable "public_subnet_id" {
  default = {}
}

variable "private_subnet_id" {
  default = {}
}

variable "component" {
  default = "vpn"
}