terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Kubernetes Provider — connects Terraform to the correct K8s cluster
provider "kubernetes" {
  config_path    = var.kubeconfig_path       # Path to kubeconfig file
  config_context = var.kube_context          # Context name (from 'kubectl config get-contexts')
}

# Helm Provider — installs charts into the same cluster as above
provider "helm" {
  kubernetes {
    config_path    = var.kubeconfig_path
    config_context = var.kube_context
  }
}

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
  instance_types = var.instance_types
  desired_size = var.desired_size
  min_size = var.min_size
  max_size = var.max_size
}

module "argocd" {
  source = "../../modules/argocd"
  chart_version =  var.chart_version
  namespace = var.namespace
  argocd_admin_password_hash = var.argocd_admin_password_hash
}