resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.Project.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.Project.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "public3" {
  vpc_id = aws_vpc.Project.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"
}

resource "aws_subnet" "private1" { 
  vpc_id = aws_vpc.Project.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"
}
 
resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.Project.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private3" {
  vpc_id = aws_vpc.Project.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1c"
}