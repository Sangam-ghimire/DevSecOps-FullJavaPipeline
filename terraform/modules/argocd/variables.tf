variable "namespace" {
  type    = string
  default = "argocd"
}

variable "chart_version" {
  type    = string
  default = "4.5.2"
}

variable "values_file_path" {
  description = "Path to the Helm values YAML file for Argo CD"
  type        = string
  default     = "default-argocd-values.yaml"
}

variable "argocd_admin_password_hash" {
  description = "BCrypt-hashed admin password"
  type        = string
}
