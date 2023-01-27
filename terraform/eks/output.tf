output "vpc_id" {
  value = aws_vpc.main.id
}

output "sg_id" {
  value = aws_security_group.my-sg-1.id
}

output "cluster_name" {
  value = aws_eks_cluster.my-eks-cluster.name
}