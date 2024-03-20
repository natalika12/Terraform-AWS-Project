resource "aws_key_pair" "project" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

# private key pair module
# module "key_pair" {
 # source = "terraform-aws-modules/key-pair/aws"

  #key_name           = "deployer-one"
  #create_private_key = true
# }