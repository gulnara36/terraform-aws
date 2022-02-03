#TargetGroup    IMAGES
resource "aws_lb_target_group" "prdx_images" {
  name     = "images"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prdx_team2.id
  health_check {
    path = "/images/"
    port = 80
  }
}
#TargetGroup    VIDEOS
resource "aws_lb_target_group" "prdx_videos" {
  name     = "videos"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prdx_team2.id
  health_check {
    path = "/videos/"
    port = 80
  }
}
#TargetGroup    DEFAULT
resource "aws_lb_target_group" "prdx_default" {
  name     = "deafult"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prdx_team2.id
}
#Load Balancer
resource "aws_lb" "prdx_team2" {
  name               = "prdxteam2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prdx_team2.id]
  subnet_mapping {
    subnet_id = aws_subnet.prdx_team2_1.id

  }
  subnet_mapping {
    subnet_id = aws_subnet.prdx_team2_2.id

  }
  access_logs {
    bucket  = aws_s3_bucket.prdxteam2.bucket
    prefix  = "prdx_lb"
    enabled = true
  }
  tags = var.tags
}
#LaunchConfiguration
resource "aws_launch_configuration" "prdx_team2_img" {
  name            = "prdx_images_LC"
  image_id        = var.ami
  instance_type   = var.prdx_inst_type
  security_groups = [aws_security_group.prdx_team2.id]
  user_data       = file("boot_img.sh")
  
}
resource "aws_launch_configuration" "prdx_team2_video" {
  name            = "prdx_videos_LC"
  image_id        = var.ami
  instance_type   = var.prdx_inst_type
  security_groups = [aws_security_group.prdx_team2.id]
  user_data       = file("boot_video.sh")
  
}
#TargetGroupAttachment
resource "aws_lb_target_group_attachment" "prdx_team2_3" {
  target_group_arn = aws_lb_target_group.prdx_default.arn
  target_id        = aws_instance.prdx_team2_ec2_3.id
  port             = 80
}

#AutoScalingAttachments
resource "aws_autoscaling_attachment" "prdx_team2" {
  autoscaling_group_name = aws_autoscaling_group.prdx_images.name
  alb_target_group_arn   = aws_lb_target_group.prdx_images.arn
}
resource "aws_autoscaling_attachment" "prdx_team2_2" {
  autoscaling_group_name = aws_autoscaling_group.prdx_videos.name
  alb_target_group_arn   = aws_lb_target_group.prdx_videos.arn
}
#LoadBalancerListeners
resource "aws_lb_listener" "prdx_team2" {
  load_balancer_arn = aws_lb.prdx_team2.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prdx_default.arn
  }
}
#LoadBalancerForwardRules
resource "aws_lb_listener_rule" "prdx_images" {
  listener_arn = aws_lb_listener.prdx_team2.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prdx_images.arn
  }

  condition {
    path_pattern {
      values = ["*/images*"]
    }
  }
}
resource "aws_lb_listener_rule" "prdx_videos" {
  listener_arn = aws_lb_listener.prdx_team2.arn
  priority     = 98

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prdx_videos.arn
  }

  condition {
    path_pattern {
      values = ["*/videos*"]
    }
  }
}
#AutoScalingGroup
resource "aws_autoscaling_group" "prdx_images" {
  name                 = "prdx_images"
  launch_configuration = aws_launch_configuration.prdx_team2_img.name
  desired_capacity     = 1
  min_size             = 1
  max_size             = 3
  vpc_zone_identifier  = [aws_subnet.prdx_team2_2.id]
  health_check_type = "EC2"
  tag {
    key = "Name"
    value = "prdx_team2_images"
    propagate_at_launch = true
  }
  
}
resource "aws_autoscaling_group" "prdx_videos" {
  name                 = "prdx_videos"
  launch_configuration = aws_launch_configuration.prdx_team2_video.name
  desired_capacity     = 1
  min_size             = 1
  max_size             = 3
  vpc_zone_identifier  = [aws_subnet.prdx_team2_2.id]
  health_check_type = "EC2"
  tag {
    key = "Name"
    value = "prdx_team2_videos"
    propagate_at_launch = true
  }
  
}
