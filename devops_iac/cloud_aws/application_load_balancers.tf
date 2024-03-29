resource "aws_lb_target_group" "front_target_group" {
  target_type = var.tg_target_type
  protocol    = var.tg_protocol
  port        = var.front_port
  vpc_id      = data.aws_vpc.vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

}

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
    target_group_arn = aws_lb_target_group.front_target_group.arn
  }

}
