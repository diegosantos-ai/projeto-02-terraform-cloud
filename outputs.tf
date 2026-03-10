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