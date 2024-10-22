# **Kubernetes Deployment of the MERN Stack**

## **Prerequisites**  
Ensure you have the following ready:  
- A running **Kubernetes cluster** (via Minikube, kubeadm, GKE, EKS, etc.)  
- **kubectl** installed and configured  

---

## **1. Create a Namespace**  
Organize the Kubernetes resources by creating a dedicated namespace for the MERN app:  

```bash
kubectl create namespace mern-devops
```  
Switch to your working directory containing the YAML configuration files:  

```bash
cd kubernetes/
```  

---

## **2. Deploy Persistent Storage**  
Ensure MongoDB data persists by setting up **PersistentVolume (PV)** and **PersistentVolumeClaim (PVC)**:  

```bash
kubectl apply -f persistentVolume.yml
kubectl apply -f persistentVolumeClaim.yml
```  

---

## **3. Deploy MongoDB with Service and Secrets**  
- Deploy **sensitive credentials** using Kubernetes **Secrets**.  
- Deploy MongoDB with a **ClusterIP** service for internal access.  

```bash
kubectl apply -f secrets.yml
kubectl apply -f mongodb.yml
```   

---

## **4. Deploy Backend (Node.js) with Service**  
Deploy the backend Node.js API, exposing it via a **NodePort** service:  

```bash
kubectl apply -f backend-config.yml
kubectl apply -f backend.yml
```  

Ensure the backend points to the MongoDB service using environment variables from the `backend-config.yml`.  

---

## **5. Deploy Frontend (React) with Service**  
Deploy the React frontend and expose it using **NodePort**:  

```bash
kubectl apply -f frontend-config.yml
kubectl apply -f frontend.yml
```  

---

## **Accessing the Application**  
Your services are now exposed with **NodePort**, allowing external access to the frontend and backend components.  

### **Retrieve the NodePorts**  
Get the service details to find the assigned NodePorts:  

```bash
kubectl get services -n mern-devops
```  

The output will show something like:

```bash
NAME        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
frontend    NodePort    10.96.45.78     <none>        5173:31000/TCP   5m
backend     NodePort    10.96.66.12     <none>        8000:31100/TCP   5m
mongodb     ClusterIP   10.96.77.23     <none>        27017/TCP        5m
```  

### **Access the Frontend**  
Open a browser and navigate to the following URL:  

```bash
http://<worker-node-ip>:<frontend-nodeport>
```  

For example:  
```  
http://192.168.49.2:31000  
```  

### **Backend API Test**  
You can also verify the backend by hitting:  
```bash
http://<worker-node-ip>:<backend-nodeport>/books
```  

---

## **Cleanup**  
When you're done, clean up the resources:  

```bash
kubectl delete ns mern-devops
```  

---