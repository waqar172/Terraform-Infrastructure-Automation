# Define the AWS region for deployment
variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "eu-west-2" # London region - standard for UK-based financial services
}

# Define the server name
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Lloyds-Web-Access-Server"
}

# Define the hardware size
variable "instance_type" {
  description = "The type of EC2 instance to start"
  type        = string
  default     = "t3.micro"
}

# Security variable for restricted access
variable "my_ip" {
  description = "Authorized IP address for SSH access"
  type        = string
  default     = "1.2.3.4/32" 
}