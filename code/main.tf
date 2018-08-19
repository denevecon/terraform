terraform {
  required_version = ">= 0.8"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-f3210e95"
  instance_type = "t1.micro"
}
