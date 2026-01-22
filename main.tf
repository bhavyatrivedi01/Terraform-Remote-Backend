provider "aws" {
        region = "us-east-1"
}

resource "aws_instance" "app-server" {
        instance_type = "t3.micro"
        ami = "ami-0ecb62995f68bb549"
}

resource "aws_s3_bucket" "s3_bucket" {
        bucket = "bhavya-remote-backend"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
     name = "LockID"
     type = "S"
}
}
