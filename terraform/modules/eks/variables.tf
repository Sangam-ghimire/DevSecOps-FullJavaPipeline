variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_end_point_public_access" {
  description = "The cluster description regarding public access"
  type = bool
  default = true
  
}

variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "eks_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
}

variable "eks_node_role_arn" {
  description = "IAM Role ARN for EKS Worker Nodes"
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types for EKS node group"
  type        = list(string)
  }

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}
