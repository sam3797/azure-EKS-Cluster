#terraform {
# required_providers {
#  aws = {
#   source = "hashicorp/aws"
#  }

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQTYCPYRQKA4JKASZ" 
  secret_key = "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"
}

kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.16.1"
    }
  }
}
