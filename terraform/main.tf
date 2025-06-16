module "aws_vpc" {
  source = "./vpc"

  env      = local.env
  eks_name = local.eks_name
  zone1    = local.zone1
  zone2    = local.zone2
}

module "aws_eks" {
  source = "./eks"

  env         = local.env
  eks_name    = local.eks_name
  eks_version = local.eks_version
  
  private_subnet_ids = module.aws_vpc.private_subnet_ids
}
