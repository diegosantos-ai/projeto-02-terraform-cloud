output "aws_region" {
  description = "Região AWS utilizada no projeto"
  value       = var.aws_region
}

output "environment" {
  description = "Ambiente definido para o projeto"
  value       = var.environment
}

output "project_name" {
  description = "Nome lógico do projeto"
  value       = var.project_name
}

output "owner" {
  description = "Responsável pelo projeto"
  value       = var.owner
}

output "vpc_id" {
  description = "ID da VPC principal do projeto"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID da subnet pública"
  value       = aws_subnet.public.id
}

output "internet_gateway_id" {
  description = "ID do Internet Gateway da VPC principal"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID da route table pública"
  value       = aws_route_table.public.id
}

output "web_security_group_id" {
  description = "ID do security group do servico web"
  value       = aws_security_group.web.id
}