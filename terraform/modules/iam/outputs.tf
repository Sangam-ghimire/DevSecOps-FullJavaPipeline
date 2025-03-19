# Output ARN of EKS Cluster IAM Role
output "eks_role_arn" {
  description = "ARN of the IAM Role for EKS Cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

# Output ARN of EKS Node IAM Role
output "eks_node_role_arn" {
  description = "ARN of the IAM Role for EKS Worker Nodes"
  value       = aws_iam_role.eks_node_role.arn
}

# Output ARN of Terraform IAM Role
output "terraform_role_arn" {
  description = "ARN of the IAM Role used by Terraform"
  value       = aws_iam_role.terraform_role.arn
}

# Output ARN of Terraform IAM Policy
output "terraform_policy_arn" {
  description = "ARN of the IAM Policy used by Terraform"
  value       = aws_iam_policy.terraform_policy.arn
}