terraform {
  required_version = ">= 0.8"
}

resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "example" {
  vpc_id            = "${aws_vpc.example.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_internet_gateway" "example" {
  vpc_id = "${aws_vpc.example.id}"
}

resource "aws_route_table" "example" {
  vpc_id = "${aws_vpc.example.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.example.id}"
  }
}

resource "aws_route_table_association" "rt_ass" {
  subnet_id      = "${aws_subnet.example.id}"
  route_table_id = "${aws_route_table.example.id}"
}

resource "aws_default_security_group" "default" {
  # name        = "default"
  # description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.example.id}"

  ingress {
    from_port = 0
    to_port   = 0

    # self        = true
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0

    # self  1p      = true
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-047bb4163c506cd98"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.example.id}"
  key_name      = "was-keyp"
  depends_on    = ["aws_internet_gateway.example"]
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = "${aws_instance.example.id}"
}
