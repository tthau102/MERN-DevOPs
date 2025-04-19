module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "${var.name}-eks-cluster"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true # Optional

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  cluster_addons = {
    coredns = {
      most-recent = true
    }
    kube-proxy = {
      most-recent = true
    }
    vpc-cni = {
      most-recent = true
    }
  }

  eks_managed_node_group_defaults = {
    instance_types                        = ["t2.large"]
    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    my-cluster-ng = {
      instance_types = ["t2.large"]
      capacity_type  = "SPOT"

      min_size     = 1
      max_size     = 3
      desired_size = 2

      disk_size                  = 30
      use_custom_launch_template = false
    }
  }

  tags = {
    Name        = "${var.name}-eks-cluster"
    Environment = var.env
    Terraform   = "true"
  }
}
