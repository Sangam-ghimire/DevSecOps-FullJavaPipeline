# DevSecOps Java Spring Boot CI/CD Project

**Tech Stacks:** Java Spring Boot, Docker, GitHub Actions, ArgoCD, Helm, Kubernetes (EKS), Terraform, Prometheus, Grafana, Loki, HPA

---

## 📁 Project Structure

```
DevSecOps-FullJavaPipeline/
├── .github/                     #CI pipelines using github-actions
├── argocd/                      # App of Apps setup for ArgoCD
│   ├── applications/
│   │   ├── dev/
│   │   ├── prod/
│   │   └── shared/
│   └── ...(root-app-(evn).yaml) 
├── demo-javaapp/                # Source code of applicaiton
├── helm/                        # Helm charts for the app
│   └── demo-javaapp/
├── k8s/                        # Additional K8s configs (namespaces etc)
|   └── namespaces/
|   └── kustomization.yaml/                        
├── infra/                       # Logging Monitoring, GitOps based Setup
│   └── logging/
│   └── monitoring/
│   
├── terraform/                   # Common terraform 
├── scripts/                     # Utility / automation scripts
├── demo-javaapp/                # Java Spring Boot source code
└── README.md                    # Project documentation
```

---

## Requirements Checklist

### 1. **CI/CD Pipeline (GitHub Actions + ArgoCD)**

-  CI builds and tests the Spring Boot app
-  Docker image is built and pushed to DockerHub/GHCR
-  ArgoCD automatically syncs Kubernetes manifests from Git
-  App-of-apps pattern used for managing environments

**CI file:**
- `.github/workflows/(filename).yaml`

### 2.  **Kubernetes Deployment via Helm**

-  Helm chart under `helm/demo-javaapp`
-  Values managed per environment (`values-dev.yaml`, `values-prod.yaml`)
-  Liveness, readiness, and startup probes configured

### 3.  **Terraform Infrastructure**

-  Separate folders (ArgoCD is also configured using Terraform)
-  Uses `backend s3` and `dynamodb` locking
-  Creates VPC, EKS, IAM roles, node groups etc. using modules in Terraform

### 4.  **Monitoring Stack (Prometheus, Grafana, Loki)**
-  Deployed via Helm and ArgoCD 
-  Loki + promtail for logs, Prometheus for metrics
-  Dashboards in Grafana for CPU usage and logs

### 5.  **Horizontal Pod Autoscaling (HPA)**

-  Configured in Helm
-  CPU and memory-based autoscaling
-  Resource requests and limits optimized
-  Clean logic using Helm conditionals

### 6.  **Docker Image Optimization**

-  Multistage Docker build 
-  Small base image 
-  Only necessary files copied

### 7.  **Security & High Availability**

-  HPA ensures scalability
-  Multiple replicas + probes = HA
-  Node pool auto-scaling via EKS
-  Can include `network policies` and `RBAC` if required

---

## 🛠️ Custom Configuration / Scripts

- Utility Script

---

## 📦 CI/CD Pipeline Flow

1. **Developer pushes code** to GitHub
2. **GitHub Actions** builds JAR, builds/pushes Docker image (tests can also be added)
3. ArgoCD watches Git repo for manifest changes
4. ArgoCD syncs Helm release to EKS
5. Prometheus/Grafana collects metrics, HPA auto-scales if needed

---

## 📊 Monitoring & Observability

- **Grafana Dashboards:**
  - Logs (Loki)
  - CPU usage per pod (Prometheus)
- **Alertmanager** configured for basic alerts
- **Prometheus Node Exporter** deployed via `kube-prometheus-stack`

---

## 🔐 Security Considerations

- RBAC policies for ArgoCD and workloads
- ServiceAccounts for Prometheus/Grafana
- Docker image with limited layers
- Probes prevent bad containers from receiving traffic

---

## Deployment URLs

- https://argocd.cloudandcosmos.com

- https://app-dev.cloudandcosmos.com

- https://app-prod.cloudandcosmos.com