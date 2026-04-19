# Define a Security Group as a "Codified Guardrail"
resource "aws_security_group" "web_access_sg" {
  name        = "web-access-sg"
  description = "Enforce secure web traffic and restricted SSH access"

  # Inbound Rule: Allow HTTPS traffic for web access
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  # Inbound Rule: Restrict SSH to a specific IP (Security Best Practice)
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip] 
  }

  # Outbound Rule: Allow all traffic for updates and patches
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Deploy the EC2 instance within the secure infrastructure
resource "aws_instance" "web_server" {
  ami                    = "ami-0903ff18ed3da91fe" # Ubuntu 22.04 LTS
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_access_sg.id]

  tags = {
    Name        = var.instance_name
    Environment = "Development"
    Project     = "InfrastructureTransformation"
  }
}