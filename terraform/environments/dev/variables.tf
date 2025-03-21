variable "aws_region" {
  description = "The aws region to be used"
  type = string
}

variable "aws_profile" {
  description = "The aws profile to be used for this project"
  type = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "min_size" {
  description = "The min number of nodes in eks cluster"
  type = number
  default = 1
}

variable "max_size" {
  type = number
  description = "The max number of nodes in eks cluster"
  default = 3
}

variable "desired_size" {
  type = number
  description = "The desired number of nodes in eks cluster"
  default = 3
}

variable "instance_types" {
  description = "The List of desired instance type of eks cluster"
  type = list(string)
  default = ["t2.micro"]
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file for accessing the Kubernetes cluster"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "The name of the kubeconfig context to use"
  type        = string
}

variable "namespace" {
  type    = string
  default = null
}

variable "chart_version" {
  type    = string
  default = null
}

variable "values_file_path" {
  description = "Path to the Helm values YAML file for Argo CD"
  type        = string
  default = null
}