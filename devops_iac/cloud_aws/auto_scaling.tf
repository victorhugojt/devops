# Creating the autoscaling launch configuration that contains AWS EC2 instance details
resource "aws_launch_configuration" "frontend_autoscaling_config" {
  name          = "frontend_config"
  image_id      = data.aws_instance.frontend_host
  instance_type = var.EC2_TYPE
  key_name      = "frontend-autoscaling-config"
}

resource "aws_autoscaling_group" "frontend_autoscaling_group" {
  availability_zones        = [var.AWS_REGION]
  name                      = "frontend-autoscaling-group"
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 30
  health_check_type         = "EC2"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
  launch_configuration      = aws_launch_configuration.frontend_autoscaling_config.name
}

resource "aws_autoscaling_schedule" "frontend_autoscaling_schedule" {
  scheduled_action_name = "frontend-autoscaling-schedule"
  min_size              = 2
  max_size              = 3
  desired_capacity      = 2
  # defining the start_time of autoscaling if you think traffic can peak at this time.
  start_time             = "2023-09-07T18:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.frontend_autoscaling_group.name
}

resource "aws_autoscaling_policy" "frontend_autoscaling_policy" {
  name = "autoscalegroup_policy"
  # The number of instances by which to scale.
  scaling_adjustment = 3
  adjustment_type    = "ChangeInCapacity"
  # The amount of time (seconds) after a scaling completes and the next scaling starts.
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.frontend_autoscaling_group.name
}

# Creating the AWS CLoudwatch Alarm that will autoscale the AWS EC2 instance based on CPU utilization.
resource "aws_cloudwatch_metric_alarm" "frontend_cloudwatch_metric_alarm" {
  # defining the name of AWS cloudwatch alarm
  alarm_name          = "web_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  # Defining the metric_name according to which scaling will happen (based on CPU) 
  metric_name = "CPUUtilization"
  # The namespace for the alarm's associated metric
  namespace = "AWS/EC2"
  # After AWS Cloudwatch Alarm is triggered, it will wait for 60 seconds and then autoscales
  period    = "60"
  statistic = "Average"
  # CPU Utilization threshold is set to 10 percent
  threshold = "10"
  alarm_actions = [
    "${aws_autoscaling_policy.frontend_autoscaling_policy.arn}"
  ]
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.frontend_autoscaling_group.name}"
  }
}
