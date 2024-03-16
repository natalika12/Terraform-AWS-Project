resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block   #string variable
  instance_tenancy = var.instance_tenancy # string variable
  tags             = var.tags
}

resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet1
  tags       = var.tags
}  
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet2
  tags       = var.tags
}  
resource "aws_subnet" "public_subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet3
  tags       = var.tags
}  
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet1
  tags       = var.tags
}  

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet2
  tags       = var.tags
}

resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet3
  tags       = var.tags
}
resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 tags   = var.tags
} 
# Attach Internet Gateway to Public Subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  
  }
 }

resource "aws_route_table" "private_route_table" {
  vpc_id       = aws_vpc.main.id
}

  #Create route table associations 
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.public_subnet3.id
  route_table_id = aws_route_table.public_route_table.id
}
 resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
 }
 resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
 }
 resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.private_route_table.id
 }
 resource "aws_eip" "nat" {
  domain     = "vpc"
 }

resource "aws_nat_gateway" "example" {
   allocation_id = aws_eip.nat.id
   subnet_id     = aws_subnet.public_subnet1.id
   depends_on = [aws_internet_gateway.gw]
   tags   = var.tags
 }