variable "common_tags" {
  default = {}
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "instance_names" {
  type = list
}

variable "security_group_tags" {
  default = {}
}

variable "sg_description" {
  type = string
}