variable "alb_name" {
  description = "ALB name"
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