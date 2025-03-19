DevSecOps-FullJavaPipeline

Project Overview

This project automates the deployment of a Java-based application using Terraform, Kubernetes, Helm, Docker, and ArgoCD. 
It uses prometheus and grafana for continuous monitoring.

It uses github actions for continuous integration.

Infrastructure as Code (IaC) with Terraform

The entire infrastructure is provisioned using Terraform for both Dev and Prod clusters.

DevSecOps-FullJavaPipeline/
│── terraform/
│   ├── modules/
│   │   ├── eks/
│   │   ├── vps
│   │   ......
│   ├── dev/
│   ├── prod/
│── helm/demo-javaapp
│── demo-javaapp
── k8s/
│   ├── monitoring-gitops/
│   ├── java-app-gitops/
── k8s/
│   ├── monitoring-gitops/
│   ├── java-app-gitops/
│   ........
│── README.md