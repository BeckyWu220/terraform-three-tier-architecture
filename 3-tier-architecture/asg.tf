# Launch Template
resource "aws_launch_template" "asg_launch_template" {
  name = "${local.private_instance_name}-${var.asg_launch_template_name}"
  description = "Launch Template for Private Instances"
  image_id = data.aws_ami.amz-linux2-ami.id
  instance_type = var.private_instance_type

  vpc_security_group_ids = [module.private_sg.security_group_id]

  key_name = var.instance_keypair
  user_data = filebase64("${path.module}/app-install.sh")

  tag_specifications {
    resource_type = "instance"
    tags = local.common_tags
  }
}

# ASG
resource "aws_autoscaling_group" "asg" {
  name = "${local.private_instance_name}-${var.asg_name}"
  desired_capacity = 2
  max_size = 5
  min_size = 1

  vpc_zone_identifier = module.vpc.private_subnets

  # target_group_arns = [module.alb.target_groups[local.target_group_name].arn]

  health_check_type = "EC2"
  health_check_grace_period = 300

  launch_template {
   id = aws_launch_template.asg_launch_template.id
   version = aws_launch_template.asg_launch_template.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    # 'launch_template' always triggers an instance refresh
    triggers = [ "desired_capacity" ] 
  }

  dynamic "tag" {
    for_each = [for k, v in local.common_tags: { key: k, value: local.common_tags[k], propagate_at_launch = true }]
    content {
      key = tag.value.key
      value = tag.value.value
      propagate_at_launch = tag.value.propagate_at_launch
    }
  }
}

# ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn = module.alb.target_groups[local.target_group_name].arn
}