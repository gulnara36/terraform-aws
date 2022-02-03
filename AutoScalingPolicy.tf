#AutoScalingPolicy
resource "aws_autoscaling_policy" "prdx_team2" {
  policy_type = "SimpleScaling"
  name                   = "Increase_one_ec2"
  scaling_adjustment     = 1
  
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.prdx_images.name
}
resource "aws_autoscaling_policy" "prdx_team2_1" {
  policy_type = "SimpleScaling"
  name                   = "Decrease_one_ec2"
  scaling_adjustment     = -1
  
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.prdx_images.name
}
resource "aws_autoscaling_policy" "prdx_team2_2" {
  policy_type = "SimpleScaling"
  name                   = "Increase_one_ec2"
  scaling_adjustment     = 1
  
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.prdx_videos.name
}
resource "aws_autoscaling_policy" "prdx_team2_3" {
  policy_type = "SimpleScaling"
  name                   = "Decrease_one_ec2"
  scaling_adjustment     = -1
  
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.prdx_videos.name
}
