data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
      profile = "default"
      region = "us-east-1"
      bucket = "statefiles-terraform-github-1234"
      key    = "eks.tfstate"
  }
}

#Retrieve EKS cluster information
provider "aws" {
  //region = data.terraform_remote_state.eks.outputs.region
  region = "us-east-1"
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name
    ]
  }
}
