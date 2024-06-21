resource "aws_instance" "EC2" {
    ami = var.ami_id
    instance_type = var.instance_name == "mongodb" ? "t2.small" : "t2.micro"

    tags = {
        Name = "TF"
    }
}