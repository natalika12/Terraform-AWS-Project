variable "path_to_public_key" {
  description = "public key location on terraform instance"
  type        = string
  default     = "/home/ec2-user/.ssh/id_rsa.pub"

}

variable "path_to_private_key" {
  description = "public key location on terraform instance"
  type        = string
  default     = "/home/ec2-user/.ssh/id_rsa"

}

variable "sec_group_name" {
  description = "please provide a sec_group_name information"
  type        = string
  default     = "my_sg"
}

variable "public_subnet1" {
  description = "please provide a subnet information"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet2" {
  description = "please provide a subnet information"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet3" {
  description = "please provide a subnet information"
  type        = string
  default     = "10.0.3.0/24"
}
variable "private_subnet1" {
  description = "please provide a subnet information"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_subnet2" {
  description = "please provide a subnet information"
  type        = string
  default     = "10.0.5.0/24"
}

variable "private_subnet3" {
  description = "please provide a subnet information"
  type        = string
  default     = "10.0.6.0/24"
}

variable "region" {
  description = "please provide a region information"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "please specify tags"
  type        = map(any)
  default     = {}
}

variable "key_name" {
  description = "please provide a key name"
  type        = string
  default     = ""
}

variable "instance_username" {
  description = "user to ssh to remote host"
  type        = string
  default     = "ec2-user"
}

variable "domain_name" {
  description = "provide domain name"
  type        = string
  default     = "nataliia.net"
}

variable "zone_id" {
  description = "provide zone id"
  type        = string
  default     = "Z0568994DIZADS96SOSP"
}

variable "database_name" {
  description = "name of RDS database"
  type        = string
  default     = "my_database"
}

variable "cluster_identifier" {
  description = "cluster identifier of RDS database"
  type        = string
  default     = "database-1"
}

variable "master_username" {
  description = "master username"
  type        = string
  default     = "team1"
}

variable "master_password" {
  description = "master password"
  type        = string
  default     = "connectionWoW"
}

variable "availability_zone" {
  description = "availability zone in region"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "cidr_block" {
  description = "please provide a cidr_block information"
  type        = string
  default     = "10.0.0.0/16"
}