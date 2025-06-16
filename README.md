# MERN DevOps Project

Ứng dụng bookstore MERN với CI/CD pipeline hoàn chỉnh.

## Tech Stack
- **App:** React + Node.js + MongoDB
- **Infrastructure:** AWS EKS + Terraform  
- **CI/CD:** Jenkins + ArgoCD
- **Container:** Docker + Kubernetes + Helm

## Architecture
```
![workflow-gif](./docs/assets/workflow.gif)
```

## Features
- Automated CI/CD pipeline
- Security scanning (Trivy, OWASP, SonarQube)
- GitOps deployment với ArgoCD
- Infrastructure as Code với Terraform
- Kubernetes orchestration

## Quick Start

### 1. Deploy Infrastructure
```bash
cd terraform/
terraform init && terraform apply
```

### 2. Setup Jenkins
- Install Docker, SonarQube, OWASP plugins
- Configure DockerHub credentials
- Create pipeline từ Jenkinsfile

### 3. Deploy Application
```bash
# Using Helm
helm install bookstore ./helm-chart

# Using Kubectl
kubectl apply -k kubernetes/
```

## Project Structure
```
├── src/                 # MERN source code
├── kubernetes/          # K8s manifests
├── helm-chart/         # Helm templates  
├── terraform/          # Infrastructure code
├── Jenkinsfile         # CI pipeline
└── gitops/Jenkinsfile  # CD pipeline
```

## Monitoring
- Frontend: `http://localhost:5173`
- Backend: `http://localhost:8000/books`
- Logs: `kubectl logs -f deployment/backend-deployment`

## CI/CD Pipeline

**Jenkins CI:**
1. Security scan (Trivy)
2. Dependency check (OWASP)  
3. Code quality (SonarQube)
4. Docker build & push

**ArgoCD CD:**
1. Monitor git changes
2. Auto-sync K8s manifests
3. Deploy to EKS

Contact: trunghautran0102@gmail.com