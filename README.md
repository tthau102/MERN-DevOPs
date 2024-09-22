# MERN Stack Application: Dockerization & Kubernetes Deployment

This guide outlines two deployment strategies for a MERN stack application:

1. **Dockerization**: Building and running containers for the frontend, backend, and MongoDB using Docker.
2. **Kubernetes Deployment**: Deploying the application on a Kubernetes cluster using `kubectl` and YAML configurations.

---

## Part 1: Dockerizing the MERN Stack Application

### Step 1: Create a Docker Network

To enable communication between the containers (frontend, backend, and MongoDB), create a custom Docker network:

```bash
docker network create docker-network
```

### Step 2: Build and Run the Frontend (React)

1. **Build the Frontend Image**
   ```bash
   cd ./frontend
   docker build -t frontend .
   ```

2. **Run the Frontend Container**
   ```bash
   docker run --name frontend --network=docker-network -d -p 5173:5173 frontend
   ```

3. **Verify the Frontend**  
   Open your browser and navigate to [http://localhost:5173](http://localhost:5173) to confirm the frontend is running properly.

### Step 3: Run MongoDB Container

Run MongoDB with a volume for data persistence:

```bash
docker run --network=docker-network --name mongodb -d -p 27017:27017 -v ~/opt/data:/data/db mongo:latest
```

### Step 4: Build and Run the Backend (Node.js API)

1. **Build the Backend Image**
   ```bash
   cd ./backend
   docker build -t backend .
   ```

2. **Run the Backend Container**
   ```bash
   docker run --name backend --network=docker-network -d -p 8000:8000 backend
   ```

### Step 5: Use Docker Compose (Optional)

To simplify container management, you can use Docker Compose to handle all services (frontend, backend, MongoDB):

```bash
docker-compose up -d
```

---

### Tagging and Pushing Docker Images to Docker Hub

After building your Docker images, you can tag them and push them to Docker Hub for easier deployment.

#### Step 1: Tag Docker Images

```bash
docker tag frontend atkaridarshan04/bookstore-frontend:v1
docker tag backend atkaridarshan04/bookstore-backend:v1
```

#### Step 2: Push Docker Images to Docker Hub

```bash
docker push atkaridarshan04/bookstore-frontend:v1
docker push atkaridarshan04/bookstore-backend:v1
```

---

## Part 2: Kubernetes Deployment of the MERN Stack

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
   http://<node-ip>:<frontend-nodeport>
   ```

---