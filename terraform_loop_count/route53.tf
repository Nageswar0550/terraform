resource "aws_route53_record" "www" {
  count   = length(var.instance_name)
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.challa.cloud"
  type    = "A"
  ttl     = 300
  records = ["${var.instance_name[count.index]}" == "web" ? "${aws_instance.EC2[count.index].public_ip}" : "${aws_instance.EC2[count.index].private_ip}"]
}