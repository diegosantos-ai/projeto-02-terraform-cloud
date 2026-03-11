variable "aws_region" {
  description = "AWS region where the infrastructure will be provisioned."
  type        = string
}

variable "project_name" {
  description = "Project name used for resource organization and naming."
  type        = string
}

variable "environment" {
  description = "Environment name used to identify the deployment context."
  type        = string
}

variable "owner" {
  description = "Owner responsible for the infrastructure resources."
  type        = string
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC do projeto"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloco CIDR da subnet pública"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_az" {
  description = "Availability Zone da subnet pública"
  type        = string
  default     = "us-east-1a"
}

variable "ssh_allowed_cidr" {
  description = "CIDR permitido para acesso SSH"
  type        = string
}