#CloudWatchAlarm
resource "aws_cloudwatch_metric_alarm" "img_cpu_high" {
  alarm_name          = "img_cpu_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "75"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.prdx_images.name
  }
  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.prdx_team2.arn]
  alarm_description = "This metric monitors ec2 cpu utilization"

}
resource "aws_cloudwatch_metric_alarm" "img_cpu_low" {
  alarm_name          = "img_cpu_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.prdx_images.name
  }
  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.prdx_team2_1.arn]
  alarm_description = "This metric monitors ec2 cpu utilization"
}
resource "aws_cloudwatch_metric_alarm" "video_cpu_high" {
  alarm_name          = "video_cpu_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "75"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.prdx_videos.name
  }
  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.prdx_team2_2.arn]
  alarm_description = "This metric monitors ec2 cpu utilization"
}
resource "aws_cloudwatch_metric_alarm" "video_cpu_low" {
  alarm_name          = "video_cpu_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.prdx_videos.name
  }
  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.prdx_team2_3.arn]
  alarm_description = "This metric monitors ec2 cpu utilization"
}
