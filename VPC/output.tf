output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}
output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}
output "public_subnet3" {
  value = aws_subnet.public_subnet3.id
}