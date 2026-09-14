# AWS Serverless Cloud Resume Challenge

![CI/CD Pipeline](https://github.com/Adonitologist/aws-cloud-resume-challenge/actions/workflows/deploy.yml/badge.svg)
![Terraform](https://img.shields.io/badge/IaC-Terraform_v1.5+-844FBA?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Serverless-232F3E?logo=amazon-aws)
![Security](https://img.shields.io/badge/Security-OIDC_Passwordless-success)

Production-ready serverless personal resume infrastructure hosted on AWS. Built with Infrastructure as Code (IaC) via Terraform, fully automated with GitHub Actions OIDC passwordless deployment, and protected with automated unit testing, TFLint analysis, and tfsec security scanners.

## System Architecture

```mermaid
flowchart TD
    Client([User Browser]) -->|HTTPS / TLS| CDN[Amazon CloudFront CDN]
    CDN -->|Origin Access Control| S3[(Amazon S3 Bucket\nPrivate Web Hosting)]
    Client -->|API Requests| API[Amazon API Gateway V2\nHTTP API Router]
    API -->|Proxy Integration| Lambda[AWS Lambda Function\nPython 3.13 Runtime]
    Lambda -->|Atomic Update| DynamoDB[(Amazon DynamoDB\nPay-Per-Request Table)]

    subgraph CI/CD Pipeline
        GA[GitHub Actions] -->|Passwordless OIDC Auth| STS[AWS STS]
        STS -->|AssumeRole| IAM[IAM GitHub Role]
        IAM -->|Terraform Apply & S3 Sync| AWS[AWS Cloud Environment]
    end

Core Technical Highlights

    Passwordless Security (OIDC): Zero persistent AWS Access Keys stored in GitHub Secrets. Deployment relies strictly on OpenID Connect federated identity (sts:AssumeRoleWithWebIdentity).

    S3 Origin Access Control (OAC): S3 bucket permissions locked to read-only access exclusively granted to CloudFront Service Principal via bucket policies.

    Atomic NoSQL Execution: Visitor tracking leverages DynamoDB ADD update expressions to prevent race conditions during high-concurrency requests.

    Automated Quality & Security Gates: Integrated GitHub Actions workflow running Python unit tests (moto mock framework), tflint static analysis, and tfsec security vulnerability inspection.

Repository Structure

.
├── .github/workflows/
│   └── deploy.yml            # CI/CD Multi-Stage Automation Workflow
├── backend/
│   ├── lambda_function.py    # Python Lambda Handler for Counter Logic
│   ├── requirements.txt      # Backend Dependencies (boto3, moto)
│   └── test_lambda.py        # Python Unit Tests
├── frontend/
│   ├── index.html            # Web Layout
│   ├── main.js               # Dynamic API Gateway Fetch Logic
│   └── style.css             # AWS UI-Themed Styling
├── main.tf                   # Main AWS Infrastructure Resources Definition
├── outputs.tf                # Infrastructure Output Values
└── README.md                 # System Documentation

Infrastructure & Local Deployment
Prerequisites

    AWS CLI v2 configured with active session.

    Terraform >= v1.5.0 installed.

Execution Commands

Initialize remote S3 backend state:
Bash

terraform init -reconfigure

Validate and format IaC files:
Bash

terraform fmt -check
tflint

Deploy AWS resources:
Bash

terraform apply -auto-approve

Destroy environment (Zero-Cost Baseline):
Bash

terraform destroy -auto-approve

