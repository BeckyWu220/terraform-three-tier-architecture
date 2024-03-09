locals {
  target_group_name = "${var.private_instance_name}-tg"
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.8.0"

  name = local.alb_name
  load_balancer_type = "application"

  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  
  security_groups = [module.lb_sg.security_group_id]

  tags = local.common_tags

  listeners = {
    http-listener = {
        port = 80
        protocol = "HTTP"
        forward = {
            target_group_key = local.target_group_name
        }
    }
  }

  target_groups = {
    "${local.target_group_name}" = {
        create_attachment = false
        name = "${local.target_group_name}"
        # name_prefix = "${local.target_group_name}-"
        protocol = "HTTP"
        protocol_version = "HTTP1"
        port = 80
        target_type = "instance"

        health_check = {
            enabled = true
            interval = 30
            path = "/index.html"
            port = "traffic-port"
            healthy_threshold = 3
            unhealthy_threshold = 3
            timeout = 6
            protocol = "HTTP"
            matcher = "200-399"
        }
    }
  }

}

# resource "aws_lb_target_group_attachment" "private-instance-tg-attachment" {
#   for_each = {for k, instance in module.private_ec2: k => instance.id}
#   target_group_arn = module.alb.target_groups[local.target_group_name].arn
#   target_id = each.value
#   port = 80
# }