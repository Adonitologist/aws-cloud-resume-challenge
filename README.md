# AWS Cloud Resume Challenge

This repository contains the infrastructure and code for my Cloud Resume Challenge project. The project is designed to demonstrate proficiency in serverless architecture and Infrastructure as Code (IaC).

## Architecture
- **Frontend:** Hosted on AWS S3 and distributed via Amazon CloudFront.
- **Backend:** A serverless API using AWS Lambda and Amazon API Gateway.
- **Database:** Visitor counter data stored in Amazon DynamoDB.
- **Infrastructure:** Fully managed via Terraform.

## Features
- Scalable, serverless architecture.
- Automated deployment processes.
- Secure access via OAC (Origin Access Control).

## Prerequisites
- AWS CLI configured with appropriate credentials.
- Terraform installed.

## Deployment
1. Initialize Terraform:
   `terraform init`
2. Apply the configuration:
   `terraform apply`
