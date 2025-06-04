### Subnets ###
resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.zone1

  tags = {
    Name                                                   = "${var.env}-private-${var.zone1}"
    "kubernetes.io/role/internal-elb"                      = "1"     # Used by EKS to create private load balancer
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned" # If you have multiple clusters running in the same VPC, or multiple AWS services sharing subnets in a VPC.
  }
}

resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.zone2

  tags = {
    Name                                                   = "${var.env}-private-${var.zone2}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.101.0/24"
  availability_zone       = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name                                                   = "${var.env}-private-${var.zone1}"
    "kubernetes.io/role/elb"                               = "1" # Used by EKS to create public load balancer
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.102.0/24"
  availability_zone       = var.zone2
  map_public_ip_on_launch = true

  tags = {
    Name                                                   = "${var.env}-private-${var.zone2}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}


