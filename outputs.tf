# Output the Public IP to verify the deployment
output "instance_public_ip" {
  description = "The public IP address of the web server"
  value       = aws_instance.web_server.public_ip
}

# Output the Instance ID for tracking/auditing
output "instance_id" {
  description = "The ID of the deployed EC2 instance"
  value       = aws_instance.web_server.id
}