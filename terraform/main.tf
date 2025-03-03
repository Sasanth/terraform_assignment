module "cloudfront" {
  source    = "./modules/cloudfront"
  origin_id = "cf-dev-domain.test.example.com"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "loadbalancer" {
  source          = "./modules/loadbalancer"
  alb_name        = "cf-alb"
  vpc_id          = module.vpc.vpc_id          # Passing the VPC ID from the VPC module
  private_subnets = module.vpc.private_subnets # Passing private subnets to the ALB module
}

module "rds" {
  source          = "./modules/rds"
  rds_name        = "mysql-rds-instance"
  secret_name     = "mysql-database-secret"
  vpc_id          = module.vpc.vpc_id # Passing the VPC ID to RDS
  private_subnets = module.vpc.private_subnets
}

module "opensearch" {
  source          = "./modules/opensearch"
  opensearch_name = "my-opensearch-domain"
}

module "vpc_link" {
  source          = "./modules/vpc_link"
  vpc_link_name   = "alb-private-link"
  vpc_link_sg_ids = module.loadbalancer.security_group
  private_subnets = module.vpc.private_subnets
}
