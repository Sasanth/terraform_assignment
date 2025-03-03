variable "vpc_link_name" {
  description = "VPC Link name"
  type        = string
}

variable "vpc_link_sg_ids" {
  description = "VPC link for the ALB"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets in the VPC"
  type        = list(string)
}
