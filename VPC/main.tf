# Specify AMI Linux-2
data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

resource "aws_ami_from_instance" "wordpress" {
  name               = "terraform-wordpress"
  source_instance_id = aws_instance.wordpress.id
}
# Create VM 
resource "aws_instance" "wordpress" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  key_name                    = aws_key_pair.project.key_name
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true

  tags = {
    "Name" : "wordpress_for_ami"
  }

  connection {
    type        = "ssh"
    user        = var.instance_username
    private_key = file(var.path_to_private_key)
    host        = aws_instance.wordpress.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd php php-mysqlnd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2",
      "cd /var/www/html",
      "sudo wget https://wordpress.org/latest.tar.gz",
      "sudo tar -xzf latest.tar.gz",
      "sudo cp -R wordpress/* /var/www/html/",
      "sudo chown -R apache:apache /var/www/html/",
      "sudo systemctl restart httpd"
    ]
  }
}