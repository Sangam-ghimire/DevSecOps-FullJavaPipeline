variable "iam_role_name" {
  default = "terraform-role"
  type = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
