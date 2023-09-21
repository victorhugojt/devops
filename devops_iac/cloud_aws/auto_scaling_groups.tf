resource "aws_autoscaling_group" "frontend_host_auto_scaling_group" {
  max_size         = 3
  min_size         = 2
  desired_capacity = 2

  vpc_zone_identifier = [
    data.aws_subnet.public_subnet.id, data.aws_subnet.public_subnet_additional.id
  ]

  launch_template {
    id = aws_launch_template.frontend_host.id
  }

  tags = [
    {
      project     = var.project,
      responsible = var.responsible,
      Name        = "frontend_host_auto_scaling_group"
    }
  ]
}
