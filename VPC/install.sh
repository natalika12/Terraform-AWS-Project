#!/bin/bash
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(tfenv init -)"' >> ~/.bashrc
source ~/.bashrc
ln -s ~/.tfenv/bin/*/usr/local/bin

#!/bin/bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer


# bash installation.sh
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