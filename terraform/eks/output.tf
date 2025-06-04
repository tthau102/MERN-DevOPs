output "cluster_name" {
  value = aws_eks_cluster.eks-cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

output "node_group_name" {
  value = aws_eks_node_group.general_node_group.node_group_name
}

output "node_role_arn" {
  value = aws_iam_role.eks-role.arn
}