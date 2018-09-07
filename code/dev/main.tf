module "vpc" {
  source = "../modules/network/"

  name = "${var.name}"

  cidr = "${var.cidr}"

  azs = "${var.azs}"

  # private_subnets     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]

  public_subnets = "${var.public_subnets}"

  private_subnets = "${var.private_subnets}"

  # database_subnets    = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]
  # elasticache_subnets = ["10.10.31.0/24", "10.10.32.0/24", "10.10.33.0/24"]
  # redshift_subnets    = ["10.10.41.0/24", "10.10.42.0/24", "10.10.43.0/24"]
  # intra_subnets       = ["10.10.51.0/24", "10.10.52.0/24", "10.10.53.0/24"]

  # create_database_subnet_group = false

  # enable_nat_gateway = true
  # single_nat_gateway = true

  # enable_vpn_gateway = true

  # enable_s3_endpoint       = true
  # enable_dynamodb_endpoint = true

  # enable_dhcp_options              = true
  # dhcp_options_domain_name         = "service.consul"
  # dhcp_options_domain_name_servers = ["127.0.0.1", "10.10.0.2"]

  # tags = {
  #   Owner       = "user"
  #   Environment = "staging"
  #   Name        = "complete"
  # }
}
