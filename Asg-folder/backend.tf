terraform {
  backend "s3" {
    bucket = "company-wide-storage-project"
    key    = "path/to/my/tfstate"
    region = "us-east-1"
  }
}
