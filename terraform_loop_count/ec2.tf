resource "aws_instance" "EC2" {
  count                  = length(var.instance_name)
  ami                    = var.ami_id
  instance_type          = var.instance_name[count.index] == "mongodb" ? "t2.small" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG_1.id]

  tags = {
    Name = var.instance_name[count.index]
  }
}