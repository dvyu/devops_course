output "instance_ip_addr" {
  value = aws_instance.ec2.public_ip
}

output "instance_ips" {
  value = aws_instance.ec2.*.public_ip
}
