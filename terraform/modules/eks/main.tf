
resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn  

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_public_access = true  
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
  instance_types  = ["t2.medium"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

 
  depends_on = [
    aws_eks_cluster.eks
  ]
}
