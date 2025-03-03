variable "rds_name" {
  description = "RDS name"
  type        = string
}

variable "secret_name" {
  description = "secret manager name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets in the VPC"
  type        = list(string)
}