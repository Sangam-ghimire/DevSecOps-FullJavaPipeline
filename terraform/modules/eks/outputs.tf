output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API Endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_worker_node_group_name" {
  description = "EKS Worker Node Group Name"
  value       = aws_eks_node_group.eks_nodes.node_group_name
}

output "eks_cluster_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  value       = var.eks_role_arn  # Use the variable instead of undeclared aws_iam_role
}

output "eks_worker_node_role_arn" {
  description = "IAM Role ARN for Worker Nodes"
  value       = var.eks_node_role_arn  # Use the variable instead of undeclared aws_iam_role
}
