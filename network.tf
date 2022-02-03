# VPC
resource "aws_vpc" "prdx_team2" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags             = var.tags
}
#Subnet_1
resource "aws_subnet" "prdx_team2_1" {
  vpc_id                  = aws_vpc.prdx_team2.id
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1.0/24"
  tags                    = var.prdx_sub1
}
#Subnet_2
resource "aws_subnet" "prdx_team2_2" {
  vpc_id                  = aws_vpc.prdx_team2.id
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.2.0/24"
  tags                    = var.prdx_sub2
}
#GateWay
resource "aws_internet_gateway" "prdx_team2" {
  vpc_id = aws_vpc.prdx_team2.id
  tags   = var.tags
}
#SecurityGroups
resource "aws_security_group" "prdx_team2" {
  vpc_id      = aws_vpc.prdx_team2.id
  name        = "prdx_team2"
  description = "Security group from Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "value"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#RouteTable
resource "aws_route_table" "prdx_team2" {
  vpc_id = aws_vpc.prdx_team2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prdx_team2.id
  }
  tags = var.tags
}
#RouteTable Association
resource "aws_route_table_association" "prdx_a" {
  subnet_id      = aws_subnet.prdx_team2_1.id
  route_table_id = aws_route_table.prdx_team2.id
}
#RouteTable Association
resource "aws_route_table_association" "prdx_b" {
  subnet_id      = aws_subnet.prdx_team2_2.id
  route_table_id = aws_route_table.prdx_team2.id
}

