output "argocd_server_hostname" {
  description = "Public LoadBalancer DNS name for Argo CD"
  value       = data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname
}
