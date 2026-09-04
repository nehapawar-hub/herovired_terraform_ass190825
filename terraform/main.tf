provider "aws" {}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  associate_public_ip_address = true

  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd

    echo "<h1>MERN Application Web Server</h1>" > /var/www/html/index.html
    echo "<p>Deployed using Terraform</p>" >> /var/www/html/index.html
  EOF

  tags = {
    Name = "MERN-Web-Server"
  }
}