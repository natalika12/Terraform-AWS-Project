# Define the EFS file system
resource "aws_efs_file_system" "project_efs" {
  creation_token = "project-efs"
  lifecycle_policy {
    # Specify lifecycle policy if needed
    transition_to_ia = "AFTER_7_DAYS"
  }
}
# Define the mount targets for the EFS file system
resource "aws_efs_mount_target" "project" {
  file_system_id         = aws_efs_file_system.project_efs.id
  subnet_id              = aws_subnet.team1.id
}
resource "aws_vpc" "main"{
    cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "team1" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"
}