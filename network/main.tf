resource "aws_vpc" "main_vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main_vpc"
  }
}
resource "aws_subnet" "public_subet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.cidr_subet
  map_public_ip_on_launch = true
  availability_zone       = var.az
  tags = {
    Name = "public_subnet"
  }
}
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "main_igw"
  }
}
