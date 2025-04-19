output "region" {
  description = "AWS region used for this infrastructure"
  value       = var.region
}

# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

# output "private_subnets" {
#   description = "Private subnets in the VPC"
#   value       = module.vpc.private_subnets
# }

# output "public_subnets" {
#   description = "Public subnets in the VPC"
#   value       = module.vpc.public_subnets
# }

# output "intra_subnets" {
#   description = "Intra (control plane) subnets in the VPC"
#   value       = module.vpc.intra_subnets
# }

# EKS Outputs
output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

# output "eks_kubeconfig" {
#   description = "Kubeconfig for the EKS cluster"
#   value       = module.eks.kubeconfig
#   sensitive   = true
# }