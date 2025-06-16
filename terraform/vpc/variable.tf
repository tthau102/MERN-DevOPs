variable "env" {
  description = "Name of the environment"
  type        = string
}

variable "eks_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "zone1" {
  description = "First availability zone"
  type = string
} 

variable "zone2" {
  description = "Second availability zone"
  type = string
} 