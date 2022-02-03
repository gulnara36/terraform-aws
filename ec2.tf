#EC2
resource "aws_instance" "prdx_team2_ec2_3" {
  ami                    = var.ami
  instance_type          = var.prdx_inst_type
  subnet_id              = aws_subnet.prdx_team2_2.id
  vpc_security_group_ids = [aws_security_group.prdx_team2.id]
  user_data              = <<EOF
    #!/bin/bash
    sudo yum install -y httpd
    sudo chmod 777 /var/www/html
    cd /var/www/html/
    sudo wget https://prdxteam2.s3.amazonaws.com/index.html
    sudo systemctl enable httpd --now
  EOF
  tags                   = var.default
}
