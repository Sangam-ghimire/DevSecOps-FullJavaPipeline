vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
cluster_name = "dev-eks-cluster"
environment = "dev"
aws_profile = "treeleafai"
aws_region = "ap-south-1"

max_size = 3
min_size = 1
desired_size = 2

instance_types = [ "t3.medium" ]

kube_context = "dev"
