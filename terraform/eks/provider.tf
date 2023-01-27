terraform {
 required_providers {
  aws = {
   source = "hashicorp/aws"
  }

kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.16.1"
    }
  }
}