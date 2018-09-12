terraform {
  backend "s3" {
    bucket = "mybucketdeneve"
    key    = "path/to/my/key"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}
