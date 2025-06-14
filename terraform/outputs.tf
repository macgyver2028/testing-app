output "vpc_id" {
  description = "ID of our VPC"
  value       = aws_vpc.main.id
}

output "ecs_cluster_name" {
  description = "Name of our ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "ecr_repository_url" {
  description = "URL of ECR repository"
  value       = aws_ecr_repository.app.repository_url
}

output "app_security_group_id" {
  description = "ID of application security group"
  value       = aws_security_group.app.id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "alb_dns_name" {
  description = "DNS name of Application Load Balancer"
  value       = aws_lb.app.dns_name
}
