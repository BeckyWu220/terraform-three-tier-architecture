output "alb_id" {
    description = "ALB Id"
    value = module.alb.id
}

output "alb_arn" {
    description = "ALB ARN"
    value = module.alb.arn
}

output "alb_dns_name" {
    description = "ALB Id"
    value = module.alb.dns_name
}

output "alb_zone_id" {
    description = "ALB Id"
    value = module.alb.zone_id
}

output "alb_target_groups" {
    description = "ALB Target Groups"
    value = module.alb.target_groups
}

output "alb_listeners" {
    description = "ALB Listeners"
    value = module.alb.listeners
}