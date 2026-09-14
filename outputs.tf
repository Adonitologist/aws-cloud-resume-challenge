output "api_endpoint" {
  value       = "${aws_apigatewayv2_api.resume_api.api_endpoint}/counter"
  description = "Public HTTP API Gateway endpoint for visitor counter"
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.resume_cdn.domain_name
  description = "CloudFront CDN domain URL serving the web application"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.resume_bucket.id
  description = "Target S3 bucket name for frontend synchronization"
}

output "github_actions_role_arn" {
  value       = aws_iam_role.github_actions_role.arn
  description = "IAM Role ARN assumed by GitHub Actions via OIDC"
}
