# Launch template
resource "aws_launch_template" "mlt" {
  name = "mlt"
  image_id      =  aws_ami_from_instance.wordpress.id
  instance_type =  "t2.micro"
  key_name      =  aws_key_pair.project.id

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.my_sg.id]  
  }
  user_data = filebase64("${path.module}/installation.sh")
}