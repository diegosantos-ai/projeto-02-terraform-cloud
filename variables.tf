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