resource "aws_route_table" "public_rt" {
  vpc_id = var.my_main_vpc_id
  tags = {
    Name = "route_table_with_igw"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.my_main_igw_id
  }
}
resource "aws_route_table_association" "public_subnet_route_table_association" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = var.my_subnet_id
}
