output "instance_id" {
  value = aws_instance.demoec2.id
}

output "public_ip" {
  value = aws_instance.demoec2.public_ip
}