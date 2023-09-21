resource "aws_lb" "front_application_lb" {
  name               = var.front_lb_name
  load_balancer_type = var.lb_type
  subnets            = [data.aws_subnet.public_subnet.id, data.aws_subnet.public_subnet_additional.id]
  security_groups    = [aws_security_group.front_instance_security_group.id]

}

resource "aws_lb_listener" "http_front" {
  load_balancer_arn = aws_lb.front_application_lb.arn
  protocol          = var.tg_protocol
  port              = var.front_port

  default_action {
    type             = "forward"
    target_group_arn = aws_autoscaling_group.frontend_host_auto_scaling_group.arn
  }

}
