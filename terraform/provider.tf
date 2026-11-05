provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "AWS-CICD"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
