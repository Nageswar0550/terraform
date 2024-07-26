locals {
  database_subnet_id = element(split(",",data.aws_paramater.database_subnet_id.value),0)
  private_subnet_id = element(split(",",data.aws_paramater.private_subnet_id.value),0)
  public_subnet_id = element(split(",",data.aws_paramater.public_subnet_id.value),0)
}