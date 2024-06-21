variable "ami_id" {
  type    = string
  default = "ami-0b4f379183e5706b9"
}

variable "instance_name" {
  type    = list(any)
  default = ["mongodb", "web", "redis", "cart", "user", "shipping", "payment", "mysql", "rabbitmq", "catalogue", "dispatch"]
}

variable "zone_id" {
  type    = string
  default = "Z10424741G2H2DBEZUCEI"
}
