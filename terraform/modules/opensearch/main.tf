# Add the aws_caller_identity data source to get the account ID
data "aws_caller_identity" "current" {}

# Add the aws_region data source to get the region
data "aws_region" "current" {}

resource "aws_opensearch_domain" "main" {
  domain_name = var.opensearch_name

  engine_version = "Elasticsearch_7.10"
  cluster_config {
    instance_type  = "t2.small.search"
    instance_count = 2
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
    volume_type = "gp2"
  }

  node_to_node_encryption {
    enabled = true
  }

  # Use the correct access_policies to control access to the domain
  access_policies = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "es:ESHttp*",
        "Resource" : "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/my-opensearch-domain/*",
        "Condition" : {
          "IpAddress" : {
            "aws:SourceIp" : ["10.0.0.0/16"] # Allow only VPC IP ranges
          }
        }
      }
    ]
  })

  domain_endpoint_options {
    enforce_https = true # Ensure that the connection to OpenSearch is always encrypted
  }
}