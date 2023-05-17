output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}

output "jenkins_url" {
  value = "http://${aws_instance.example.public_ip}:8080"
}

output "tomcat_url" {
  value = "http://${aws_instance.example.public_ip}:8081"
}

output "instance_dns" {
  value = aws_instance.example.public_dns
}

output "security_group_id" {
  value = aws_security_group.example.id
}
