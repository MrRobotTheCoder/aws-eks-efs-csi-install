# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.31"
     }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.12"
    }
    http = {
      source = "hashicorp/http"
      version = ">= 3.3"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20"
    }      
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "aws-eks-with-terraform-remote-state-storage"
    key    = "dev/efs-csi/terraform.tfstate"
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "dev-efs-csi"    
  }     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}