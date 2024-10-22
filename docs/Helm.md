# Helm Installation and Chart Deployment Guide

## Step 1: Install Helm

Run the following command to install Helm on your machine:

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

Verify the installation:

```bash
helm version
```

---

## Step 2: Clone the Repository

Clone the GitHub repository:

```bash
git clone https://github.com/atkaridarshan04/MERN-DevOps.git
```

Change into the Helm charts directory:

```bash
cd MERN-DevOps/helm
```

---

## Step 3: Customize `values.yaml` Files

Modify the environment variables in the `values.yaml` files for the **backend** and **frontend** charts to ensure they point to the correct services for your deployment.

### Backend `backend-chart/values.yaml`
```yaml
env:
  port: "8000" # Update this if your backend runs on a different port
  mongodb_url: "mongodb://mongodb-chart:27017/db" # Ensure this matches your MongoDB service name
```

### Frontend `frontend-chart/values.yaml`
```yaml
env:
  vite_api_backend_url: "http://192.168.49.2:31100" # Replace with your EC2 instance IP and port
```

**Note:** The example values provided here are specific to this deployment. Make sure to modify these values according to your environment and service configurations.

---

## Step 4: Package the Helm Charts

Package all the charts into `.tgz` files. Run the following command from the helm directory:

```bash
helm package backend-chart
helm package frontend-chart
helm package mongodb-chart
```

This will create `.tgz` files for each chart in the current directory.

---

## Step 5: Install the Helm Charts

Install each chart using Helm.

### Install MongoDB Chart
```bash
helm install mongodb-chart ./mongodb-chart
```

### Install Backend Chart
```bash
helm install backend-chart ./backend-chart
```

### Install Frontend Chart
```bash
helm install frontend-chart ./frontend-chart
```

---

## Step 6: Verify the Installation

List all Helm releases to confirm they are deployed:

```bash
helm ls
```

Check the status of all resources in the Kubernetes cluster:

```bash
kubectl get all -n mern-devops
```

You should see the running pods, services, and deployments associated with your MongoDB, backend, and frontend charts.

---

## Step 7: Access the Application

Make sure the frontend service is exposed via **NodePort**. Use the following address to access the application:

```
http://<ec2-workerNode-ip>:31000
```

Replace `<ec2-workerNode-ip>` with the public IP address of your EC2 worker node.

---

## Step 8: Cleanup

If you need to uninstall the deployed Helm charts, use the following commands:

### Uninstall MongoDB Chart
```bash
helm uninstall mongodb-chart
```

### Uninstall Backend Chart
```bash
helm uninstall backend-chart
```

### Uninstall Frontend Chart
```bash
helm uninstall frontend-chart
```

After uninstalling the charts, you can also check the status to confirm that the resources have been removed:

```bash
kubectl get all
```

List all Helm releases to confirm they are uninstalled:

```bash
helm ls
```

---