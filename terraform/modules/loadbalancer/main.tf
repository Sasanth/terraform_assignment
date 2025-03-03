resource "aws_lb" "main" {
  name                       = var.alb_name
  internal                   = true # Set ALB as internal (private)
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.lb_sg.id]
  subnets                    = var.private_subnets # Use the passed private subnets
  enable_deletion_protection = false
}

resource "aws_security_group" "lb_sg" {
  name        = "${var.alb_name}-sg"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id # Use the passed VPC ID from the root module
}

resource "aws_lb_target_group" "main" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id # Use the passed VPC ID
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  default_action {
    type = "fixed-response"
    fixed_response {
      status_code  = "200"
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}