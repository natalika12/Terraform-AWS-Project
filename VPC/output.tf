output "vpc_id" {
  value = aws_vpc.project.id
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
output "database_endpoint" {
  value = aws_rds_cluster.db_instance.endpoint
}


output "aws_alb_dns_name" {
  value = aws_alb.application-lb.dns_name
}

output "database_writer_endpoint" {
  value = aws_rds_cluster_instance.writer_instance[0].endpoint
}

output "instance_public_ip" {
value = aws_instance.wordpress.public_ip
}