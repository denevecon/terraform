variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "0.0.0.0/0"
}

variable "azs" {
  description = "Availability zone for the VPC"
  default     = "eu-west-1a"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}
