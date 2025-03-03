# ChatGPT Store Application – AWS Architecture

## Overview
This repository contains the AWS architecture design for deploying the ChatGPT Store Application with scalability, security, and high availability.

## Architecture Components
- **Compute:** ECS for containerized ChatGPT API
- **Networking:** VPC, subnets, Security Groups, WAF
- **Storage:** RDS (Aurora), DynamoDB, S3
- **Traffic Management:** API Gateway, CloudFront, ElastiCache
- **Monitoring:** CloudWatch, AWS X-Ray, AWS Config

## Deployment Steps
1. Set up VPC, subnets, and security configurations.
2. Deploy ECS for running ChatGPT API containers.
3. Configure ALB and Auto Scaling policies.
4. Set up RDS and DynamoDB for data storage.
5. Deploy API Gateway and CloudFront for request handling.
6. Enable CloudWatch for monitoring and alerting.

## Architecture Diagram
Refer to `architecture_diagram.png` for the visual representation.

## Security Best Practices
- Use IAM roles with least privilege access.
- Encrypt data at rest and in transit.
- Implement WAF and Shield for protection.

## Monitoring and Logging
- CloudWatch for logs and alerts.
- AWS X-Ray for tracing API requests.
- AWS Config for compliance tracking.

## License
This project follows the MIT License.
