packer {
        required_plugins {
                amazon = {
                        version = ">= 0.0.1"
                        source = "github.com/hashicorp/amazon"
                }
        }
}

source "amazon-ebs" "image" {
        ami_name             = "project-image {{timestamp}}"
        ssh_private_key_file = "~/.ssh/id_rsa"
        ssh_keypair_name     = "packer"
        instance_type        = "t2.micro"
    // ami_regions = [
    //     "us-east-1",
    //     "us-east-2",
    //     "eu-west-1",
    // ]
        region               = "us-east-1"
        source_ami = "ami-0c5f64f4c16e68c88"
        run_tags = {
                Name = "Packer instance for project-image"
        }
}

build {
        sources = [
                "source.amazon-ebs.image"
        ]
        provisioner "shell" {
                inline = [
        #!/bin/bash 
        # Work with Amazon AMI on this
        "sudo yum install httpd -y",
        "sudo yum install php php-mysql -y",
        "sudo systemctl restart httpd",
        "sudo systemctl enable httpd",
        "sudo yum install wget -y",
        "sudo wget https://wordpress.org/wordpress-4.0.32.tar.gz",
        "sudo tar -xf wordpress-4.0.32.tar.gz -C /var/www/html/",
        "sudo mv /var/www/html/wordpress/* /var/www/html/",
        "sudo chown -R apache:apache /var/www/html/",
        "sudo systemctl restart httpd"
                ]
        }
        provisioner "breakpoint" {
                note = "Waiting for your verification"
        }
}