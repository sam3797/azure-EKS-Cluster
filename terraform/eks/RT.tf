resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "rt-association" {
  subnet_id      = aws_subnet.main-subnet-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "rt-association-1" {
  subnet_id      = aws_subnet.main-subnet-2.id
  route_table_id = aws_route_table.public-rt.id
}