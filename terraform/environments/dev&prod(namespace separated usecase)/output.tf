output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API Endpoint"
  value       = module.eks.eks_cluster_endpoint
}

output "eks_worker_node_group_name" {
  description = "EKS Worker Node Group Name"
  value       = module.eks.eks_worker_node_group_name
}

output "eks_vpc_id" {
  description = "VPC ID where EKS is deployed"
  value       = module.vpc.vpc_id
}

output "eks_private_subnets" {
  description = "Private Subnet IDs used by EKS"
  value       = module.vpc.private_subnets
}
output "argocd_url" {
  description = "URL to access Argo CD UI"
  value       = "https://${module.argocd.argocd_server_hostname}"
}
