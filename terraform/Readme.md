# Modular Terraform Infrastructure Deployment

## Overview
This repository contains a modular Terraform script to provision key AWS infrastructure components for deploying a ChatGPT Store Application. Each component is designed as a reusable Terraform module to ensure scalability, security, and high availability.

## Infrastructure Components
The following AWS resources are provisioned as separate modules:
- **Amazon CloudFront** - Content Delivery Network (CDN) for caching and accelerating content delivery.
- **Application Load Balancer (ALB)** - Distributes incoming traffic across multiple targets to ensure high availability.
- **Amazon RDS** - Relational Database Service for managed database hosting.
- **Amazon OpenSearch Service** - Provides search and analytics capabilities.
- **VPC Link Endpoint** - Enables secure connectivity to private resources.

## Prerequisites
Before using this Terraform configuration, ensure you have:
- Terraform **1.x** installed ([Download Terraform](https://www.terraform.io/downloads))
- AWS CLI configured with appropriate IAM permissions ([AWS CLI Setup](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))
- An S3 bucket for remote state storage

## Repository Structure
```
├── modules/
│   ├── cloudfront/
│   ├── loadbalancer/
│   ├── rds/
│   ├── opensearch/
│   ├── vpc_link/
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── README.md
```

### Outputs
Key details of the provisioned resources are available in `outputs.tf`, such as:
- CloudFront distribution ID
- ALB DNS name
- RDS endpoint
- OpenSearch domain endpoint
- VPC Link ID

## Remote State Management
To ensure collaboration and state consistency, Terraform state is stored in an S3 bucket with DynamoDB state locking.

Example `backend.tf`:
```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-142"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}
```

## Deployment Steps
1. **Initialize Terraform**
   ```sh
   terraform init
   ```

2. **Plan the deployment**
   ```sh
   terraform plan
   ```

3. **Apply the configuration**
   ```sh
   terraform apply -auto-approve
   ```

4. **Destroy the infrastructure (if needed)**
   ```sh
   terraform destroy
   ```

## Security Considerations
- **Restrict Public Access:** Security groups are configured to restrict public access to sensitive resources.
- **Secrets Management:** Sensitive information such as database credentials should be managed via AWS Secrets Manager.
- **Encryption:** RDS and OpenSearch encryption is enabled for data security.

## License
This project is licensed under the MIT License.