locals {
  az_list = slice(data.aws_availability_zones.az.names, 0, 2)
  name = "${var.project_name}-${var.environment}"
}