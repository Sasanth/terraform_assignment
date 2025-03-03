output "cloudfront_distribution_id" {
  value = module.cloudfront.distribution_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "loadbalancer_dns_name" {
  value = module.loadbalancer.dns_name
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "opensearch_endpoint" {
  value = module.opensearch.endpoint
}

output "vpc_link_id" {
  value = module.vpc_link.vpc_link_id
}
