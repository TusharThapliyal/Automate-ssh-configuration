resource "aws_vpc" "my_main_vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main_vpc"
  }
}
resource "aws_subnet" "my_public_subet" {
  vpc_id                  = aws_vpc.my_main_vpc.id
  cidr_block              = var.cidr_subet
  map_public_ip_on_launch = true
  availability_zone       = var.az
  tags = {
    Name = "public_subnet"
  }
}
resource "aws_internet_gateway" "my_main_igw" {
  vpc_id = aws_vpc.my_main_vpc.id
  tags = {
    Name = "main_igw"
  }
}
