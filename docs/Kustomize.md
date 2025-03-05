# Managing Kubernetes Deployments with Kustomize

## Why Use Kustomize?
Kustomize simplifies Kubernetes configurations by allowing environment-specific customizations without modifying the base YAML files. It solves the problem of managing multiple environments (e.g., Dev, Prod) by providing a structured way to apply changes dynamically.

## Environment Stages
We have two environments configured:

- **Development (`overlays/dev`)**
- **Production (`overlays/prod`)**

### Changes in Each Environment
Each environment applies patches to modify the following:

1. **Replica count**
   - Dev: `replicas: 1`
   - Prod: `replicas: 2`

2. **Container image versions**
   - Different images for Dev and Prod.

## ConfigMap & Secret Management
We use **configMapGenerator** and **secretGenerator** in Kustomize instead of separate YAML files.

![Kustomize Config](./assets/kustomize-config.png)

Ensure these configurations are properly set up before deployment in [`/base/kustomization.yml`](../kustomize/base/kustomization.yml).

---

## Deploying Using Kustomize

### Setting Up the Namespace
Before deploying, create the `mern-devops` namespace and switch the context to it:

```bash
kubectl create namespace mern-devops
kubectl config set-context --current --namespace=mern-devops
```

### Verify Configuration Before Deployment
```bash
kubectl kustomize overlays/dev  # Check Dev environment
kubectl kustomize overlays/prod  # Check Prod environment
```

### Deploy the Application

#### Deploy Dev Environment
```bash
kubectl apply -k overlays/dev
```

#### Deploy Prod Environment
```bash
kubectl apply -k overlays/prod
```

**Note:** If applying both in the same cluster, change the node ports for frontend and backend deployments.

---

## Verifying Deployment

### Check Configurations Applied to Backend
```bash
kubectl get configmap backend-config -o yaml -n mern-devops
```

### Check Running Pods
```bash
kubectl get pods -n mern-devops
```

### Check Service Endpoints
```bash
kubectl get svc -n mern-devops
```

---

## Accessing the Application
Once deployed, access the frontend at:

```bash
http://<NODE_IP>:31000
```

To find the **Node IP**, run:

```bash
kubectl get nodes -o wide
```

---

## Deleting Everything
To delete all resources:

```bash
kubectl delete -k overlays/dev  # For Dev
kubectl delete -k overlays/prod  # For Prod
```

Or delete everything in the namespace:

```bash
kubectl delete namespace mern-devops
```

---

## Additional Useful Commands

### Check Logs for Backend & Frontend
```bash
kubectl logs -l app=backend -n mern-devops
kubectl logs -l app=frontend -n mern-devops
```

### Restart Backend & Frontend
```bash
kubectl rollout restart deployment backend-deployment -n mern-devops
kubectl rollout restart deployment frontend-deployment -n mern-devops
```

---

## Conclusion
- Kustomize helps manage multiple environments efficiently.
- Uses patches for environment-specific changes.
- ConfigMaps & Secrets are handled via Kustomize.
- Ensure the `mern-devops` namespace exists before deployment.
- Easily apply, verify, and access your application.

Now you're set to deploy your MERN stack using Kustomize!

---