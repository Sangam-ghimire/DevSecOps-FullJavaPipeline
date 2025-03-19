module "iam" {
  source = "../../modules/iam"
  cluster_name = var.cluster_name
}

module "s3" {
  source         = "../../modules/s3"
  bucket_name    = "dev-terraform-state-bucket-latest"
  dynamodb_table = "dev-terraform-locks-latest"
  environment    = var.environment
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  environment = var.environment
}

module "eks" {
  source      = "../../modules/eks"
  cluster_name = var.cluster_name
  environment = var.environment
  subnet_ids   = module.vpc.private_subnets
  eks_role_arn    = module.iam.eks_role_arn       
  eks_node_role_arn = module.iam.eks_node_role_arn 
}


