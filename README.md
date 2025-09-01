## Kubernetes Learning Projects 🚀

# 📌 Overview

This repository documents my journey of learning Kubernetes step by step through practical, real-world projects.
Each project builds on the previous one, starting from the basics and moving towards more advanced use cases.

The repo is structured so that I (or anyone else) can quickly revisit concepts and reproduce the projects anytime.

📂 Repository Structure
kubernetes-learning-projects/
│
├── project-01-nginx-deployment/    # Deploy a simple Nginx app
├── project-02-hpa-autoscaling/     # Auto-scale Nginx with HPA
├── project-03-configmap-secrets/   # Manage configs & secrets
└── README.md                       # High-level overview (this file)

# 🎯 Learning Roadmap
🔹 Stage 1: Beginner Projects (Foundations)

Project 1: Nginx Deployment

Deploy a basic Nginx application

Expose it with a Service

Scale replicas manually

Project 2: Horizontal Pod Autoscaler

Define CPU/memory requests & limits

Enable Metrics Server

Auto-scale Pods based on CPU load

Project 3: ConfigMaps & Secrets

Manage app configuration with ConfigMaps

Store sensitive data in Secrets

Inject configs into Deployments

🔹 Stage 2: Intermediate Projects (Coming Soon 🚧)

Guestbook App (Frontend + Backend + Redis)

CI/CD Pipeline with GitHub Actions or GitLab CI

Monitoring & Logging (Prometheus + Grafana + Loki/ELK)

🔹 Stage 3: Advanced Beginner / Intermediate Projects (Planned)

Ingress & TLS with Cert-Manager

Jobs & CronJobs (batch processing)

Service Mesh (Istio or Linkerd)

# 🧑‍💻 How to Use This Repo

Navigate to each project folder.

Read the README.md inside for detailed steps.

Apply YAML manifests using:

kubectl apply -f <file-name>.yaml


Clean up using:

kubectl delete -f <file-name>.yaml

# 🎯 Goal

By completing these projects, I aim to:

Build a strong hands-on foundation in Kubernetes.

Create a portfolio of real-world projects for interviews.

Be comfortable deploying and managing applications on Kubernetes in production-like scenarios.