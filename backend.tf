terraform {
  backend "s3" {
    bucket         = "demobucket"
    key            = "env/dev/ec2.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}