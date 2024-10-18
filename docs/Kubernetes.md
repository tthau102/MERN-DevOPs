# Kubernetes Deployment of the MERN Stack

### Prerequisites

Before deploying the MERN stack to Kubernetes, ensure the following:

- A running Kubernetes cluster (set up via `kubeadm`, Minikube, GKE, EKS, etc.)
- `kubectl` installed and configured
- Docker images available either on Docker Hub or locally

### Step 1: Create a Namespace

Organize Kubernetes resources by creating a namespace for your MERN application:

```bash
kubectl create ns mern-devops
```

Switch to the directory containing your Kubernetes YAML configurations:

```bash
cd kubernetes/
```

### Step 2: Deploy Persistent Storage

Create persistent storage for MongoDB using PersistentVolume (PV) and PersistentVolumeClaim (PVC):

```bash
kubectl apply -f persistentVolume.yml
kubectl apply -f persistentVolumeClaim.yml
```

### Step 3: Deploy MongoDB with Service

Deploy MongoDB and expose it through a service:

```bash
kubectl apply -f mongodb.yml
```

### Step 4: Deploy the Backend (Node.js) with Service

Deploy the backend service:

```bash
kubectl apply -f backend.yml
```

### Step 5: Deploy the Frontend (React) with Service

Deploy the frontend service:

```bash
kubectl apply -f frontend-config.yml
kubectl apply -f frontend.yml
```

---

## Accessing the Application

Your services are exposed using **NodePort**, allowing external access to both the frontend and backend.

1. **Retrieve the NodePort** for frontend and backend:
   ```bash
   kubectl get services -n mern-devops
   ```

2. **Access the Frontend**:
   Open your browser and navigate to:
   ```bash
   http://<ec2-workerNode-ip>:<frontend-nodeport>
   ```

---
