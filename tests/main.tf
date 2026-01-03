terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  alias  = "delegating"
  region = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  default_tags {
    tags = {
      Environment = "test"
    }
  }
}

provider "aws" {
  alias  = "delegated"
  region = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  default_tags {
    tags = {
      Environment = "test"
    }
  }
}

module "delegation" {
  source = "../"

  route53_delegating_zone = "example.com"
  route53_delegated_zone  = "sub.example.com"

  providers = {
    aws.delegating = aws.delegating
    aws.delegated  = aws.delegated
  }
}
