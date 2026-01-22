terraform {
  backend "s3" {
    bucket = "bhavya-remote-backend"
    key    = "bhavya/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
~
