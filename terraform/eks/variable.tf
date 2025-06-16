variable "env" {
  description = "Name of the environment"
  type        = string
}

variable "eks_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_version" {
  description = "Version of EKS cluster"
  type        = number
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS worker nodes"
  type        = list(string)
}