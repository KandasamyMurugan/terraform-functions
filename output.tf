output "public-instance-ip" {
  value = aws_instance.public-instance.*.public_ip
}

output "private-instance-ip" {
  value = aws_instance.private-instance.*.private_ip
}