
resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn  

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_public_access = var.eks_end_point_public_access  
  }

  tags = {
    Environment = var.environment
  }
}


resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.cluster_name}-nodes"
  node_role_arn   = var.eks_node_role_arn  
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

 
  depends_on = [
    aws_eks_cluster.eks
  ]
}
