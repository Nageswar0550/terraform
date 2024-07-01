variable "sg_name" {
  type = list
}

variable "sg_description" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_id_default" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map
  default = {}
}

variable "sg_tags" {
  type = map
  default = {}
}