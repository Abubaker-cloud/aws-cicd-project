# AWS CI/CD Pipeline – Automated Flask Deployment

A production-oriented CI/CD project that automates testing, Docker image building, publishing to Amazon ECR, and deployment to Amazon EC2 using GitHub Actions and AWS Systems Manager.

## Project Overview

This project demonstrates an automated deployment pipeline for a Python Flask application running inside Docker containers on AWS.

Every push to the `main` branch triggers the pipeline automatically.

## Architecture

```text
Developer
   |
   v
GitHub Repository
   |
   v
GitHub Actions
   |
   +----> Pytest
   |
   +----> Docker Build
   |
   v
GitHub OIDC Authentication
   |
   v
Amazon ECR
   |
   v
AWS Systems Manager (SSM)
   |
   v
Amazon EC2
   |
   +----> Flask + Gunicorn
   |
   +----> Nginx Reverse Proxy
```

## Technologies Used

| Category | Technologies |
|---|---|
| Cloud | AWS |
| Infrastructure as Code | Terraform |
| CI/CD | GitHub Actions |
| Authentication | AWS IAM OIDC |
| Containerization | Docker |
| Container Registry | Amazon ECR |
| Compute | Amazon EC2 |
| Deployment | AWS Systems Manager |
| Web Server | Nginx |
| Backend | Python, Flask, Gunicorn |
| Testing | Pytest |

## AWS Services

- Amazon EC2
- Amazon ECR
- AWS IAM
- AWS Systems Manager
- Amazon VPC
- Security Groups
- Internet Gateway
- CloudWatch

## CI/CD Workflow

1. Developer pushes code to GitHub.
2. GitHub Actions starts automatically.
3. Pytest runs automated application tests.
4. Docker builds a new application image.
5. GitHub authenticates with AWS using OIDC.
6. Docker image is pushed to Amazon ECR.
7. AWS Systems Manager sends deployment commands to EC2.
8. Docker Compose updates the application container.
9. Application health is verified.

## Security

- GitHub Actions uses OpenID Connect (OIDC).
- No long-lived AWS access keys are stored in GitHub Secrets.
- IAM roles provide controlled AWS permissions.
- EC2 deployment uses Systems Manager instead of SSH.
- Docker images are stored in Amazon ECR.

## Infrastructure

Terraform provisions the AWS infrastructure, including:

- VPC and public subnet
- Internet Gateway and route table
- EC2 instance
- Security Group
- IAM instance role
- Amazon ECR repository
- GitHub OIDC provider
- GitHub Actions IAM role

## Application Endpoints

| Endpoint | Purpose |
|---|---|
| `/` | Application information |
| `/health` | Application health check |

## Testing

Automated tests are executed using Pytest.

```bash
python -m pytest -v
```

Expected result:

```text
tests/test_app.py::test_home_endpoint PASSED
tests/test_app.py::test_health_endpoint PASSED

2 passed
```

## Deployment Verification

The application was successfully deployed to Amazon EC2.

The deployment was verified through:

- HTTP 200 response from the home endpoint.
- HTTP 200 response from the health endpoint.
- Successful Docker container health check.
- Successful automated deployment after a code update.

## Key Learning Outcomes

- Building automated CI/CD pipelines.
- Implementing Infrastructure as Code with Terraform.
- Securing GitHub-to-AWS authentication using OIDC.
- Building and publishing Docker images.
- Deploying applications using AWS Systems Manager.
- Automating application testing and deployment.

## Author

**Abubaker Abdallh**

B.Tech Information Technology | Cloud & DevOps Engineering

GitHub: https://github.com/Abubaker-cloud

---

*Built as a hands-on AWS Cloud and DevOps engineering project.*
