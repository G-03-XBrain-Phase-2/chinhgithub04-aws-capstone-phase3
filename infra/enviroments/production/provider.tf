terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "tfstate-capstone3-cdo-03"
    key          = "infra/environments/production/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.tags["Environment"]
      Owner       = var.tags["Owner"]
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}
