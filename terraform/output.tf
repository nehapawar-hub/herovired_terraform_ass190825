output "web_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web.public_ip
}

output "web_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}