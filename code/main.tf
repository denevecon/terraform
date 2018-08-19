terraform {
  required_version = ">= 0.8"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-f3210e95"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.eu-west-1a-public.id}"
  depends_on    = ["aws_internet_gateway.gw"]
}

resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "eu-west-1a-public" {
  vpc_id            = "${aws_vpc.example.id}"
  cidr_block        = "10.0.1.0/25"
  availability_zone = "eu-west-1a"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.example.id}"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = "${aws_instance.example.id}"
}
