variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Primary AWS region for deployment"
}

variable "state_bucket_name" {
  type        = string
  default     = "juaneslava-terraform-state-2026"
  description = "S3 bucket for remote Terraform state storage"
}

variable "frontend_bucket_name" {
  type        = string
  default     = "juaneslava-cloud-resume-2026"
  description = "S3 bucket name for hosting static frontend assets"
}

variable "github_repository" {
  type        = string
  default     = "Adonitologist/aws-cloud-resume-challenge"
  description = "GitHub repository formatted as owner/repo for OIDC condition"
}
