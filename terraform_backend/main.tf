resource aws_instance "main" {
    ami = data.aws_ami.ami_id.id
    vpc_security_group_ids = [aws_security_group.SG_1.id]
    instance_type = "t2.micro"
}