### IAM Role ###
resource "aws_iam_role" "eks-role" {
  name = "${var.env}-${var.eks_name}-eks-role"

  # This IAM role is used by the EKS cluster to manage AWS resources.
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ]
}
POLICY
}

### IAM Role Policy Attachment for EKS Cluster ###
resource "aws_iam_role_policy_attachment" "eks-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-role.name
}

### EKS Cluster ###
resource "aws_eks_cluster" "eks-cluster" {
  name = "${var.env}-${var.eks_name}-cluster"
  version = var.eks_version
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    endpoint_private_access = false  
    endpoint_public_access = true 

    # subnet_ids = [
    #   aws_subnet.private_zone1,
    #   aws_subnet.private_zone2
    # ]

    subnet_ids = var.private_subnet_ids
  }

  access_config {
    authentication_mode = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [ aws_iam_role_policy_attachment.eks-policy ]
}
