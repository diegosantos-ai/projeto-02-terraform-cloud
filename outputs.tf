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

output "name_prefix" {
  description = "Prefixo padrão para nomeação dos recursos"
  value       = var.name_prefix
}

output "common_tags" {
  description = "Tags padrão aplicadas aos recursos do projeto"
  value       = var.common_tags
}