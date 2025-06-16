output "eks_cluster_endpoint" {
  value = module.aws_eks.cluster_endpoint
}

output "vpc_id" {
  value = module.aws_vpc.vpc_id
}
