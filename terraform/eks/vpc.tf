resource "aws_vpc" "main" {
  cidr_block           = "10.20.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet-1"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "main-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.20.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet-2"
    "kubernetes.io/role/elb" = "1"
  }
}