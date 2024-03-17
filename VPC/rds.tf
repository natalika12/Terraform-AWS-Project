##Create subnet group for RDS
resource "aws_db_subnet_group" "project_db_subnet_group" {
  name       = "project_db_subnet_group"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id, aws_subnet.private3.id]
}

#Create security group for RDS
resource "aws_security_group" "database_sg" {
  name        = "database-sg"
  description = "Allow MySQL access from EC2 instance"
  vpc_id      = aws_vpc.Project.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Create cluster RDS
resource "aws_rds_cluster" "db_instance" {
  cluster_identifier     = var.cluster_identifier
  engine                 = "aurora-mysql"
  availability_zones     = var.availability_zones
  database_name          = var.database_name
  master_username        = var.master_username
  master_password        = var.master_password
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.project_db_subnet_group.id
}

resource "aws_rds_cluster_instance" "writer_instance" {
  count                = 1
  identifier           = "writer-instance"
  cluster_identifier   = aws_rds_cluster.db_instance.id
  instance_class       = "db.t3.medium"
  engine               = "aurora-mysql"
  db_subnet_group_name = aws_db_subnet_group.project_db_subnet_group.id
}

resource "aws_rds_cluster_instance" "reader_instances" {
  count                = 3
  identifier           = "reader-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.db_instance.id
  instance_class       = "db.t3.medium"
  engine               = "aurora-mysql"
  db_subnet_group_name = aws_db_subnet_group.project_db_subnet_group.id
}