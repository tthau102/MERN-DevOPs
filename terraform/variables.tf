variable "region" {
  default     = "eu-north-1"
  description = "AWS Region"
  type        = string
}

variable "name" {
  default     = "mern-devops"
  description = "Project Name"
  type        = string
}

variable "env" {
  default     = "prod"
  description = "Project Environment"
  type        = string
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  cidr            = "10.0.0.0/16"
  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  intra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]
}
