

# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Create Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instance
resource "aws_instance" "my_ec2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.ec2_sg.name]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y java-17-amazon-corretto
              yum install -y git
              EOF

  tags = {
    Name = "Terraform-EC2-Java-Git"
  }
}

# Create AMI from EC2
resource "aws_ami_from_instance" "my_ami" {
  name               = "terraform-java-git-ami"
  source_instance_id = aws_instance.my_ec2.id

  depends_on = [aws_instance.my_ec2]
}

output "instance_id" {
  value = aws_instance.my_ec2.id
}

output "ami_id" {
  value = aws_ami_from_instance.my_ami.id
}