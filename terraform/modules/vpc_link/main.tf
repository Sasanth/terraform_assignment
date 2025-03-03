resource "aws_apigatewayv2_vpc_link" "main" {
  name = var.vpc_link_name
  security_group_ids = [var.vpc_link_sg_ids]
  subnet_ids = var.private_subnets
}
