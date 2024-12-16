# **MERN DevOps Project**

This project is designed to facilitate the deployment of a MERN (MongoDB, Express, React, Node.js) application. By using technologies such as **Docker** for containerization, **Kubernetes** for orchestration, **Jenkins** for continuous integration and delivery (CI/CD), and **ArgoCD** for GitOps-based continuous deployment.

---

## **Overview**

The MERN DevOps project includes:

- **Dockerization**: Building and running containers for the frontend, backend, and MongoDB using Docker and docker compose.
- **Kubernetes Deployment**: Deploying the application on a kind Kubernetes cluster and configuring an ingress controller.
- **CI/CD Pipeline**: Automating multiple SDLC stages using Jenkins.
- **Helm Deployment**: Managing Kubernetes deployments using Helm charts for MongoDB, backend, and frontend services.
- **ArgoCD GitOps**: Continuously deploying and synchronizing the application with the GitHub repository.
- **Observability**: Implementing monitoring mechanisms using tools like Prometheus and Grafana to monitor the health and performance of the application.
---

## **Project Deployment Flow**

![workflow-gif](./docs/assets/workflow.gif)

---

## **Documentation**

To understand the various components of this project, refer to the following documentation:

- **[Docker.md](./docs/Docker.md)**:  
  Detailed instructions on how to build and run the MERN stack application using Docker, including creating a Docker network, building images, and managing containers.

- **[Kubernetes.md](./docs/Kubernetes.md)**:  
  Detailed instructions on deploying the MERN stack application using Kubernetes, including how to set up persistent storage, deploy services, and access the application.

- **[Jenkins.md](./docs/Jenkins.md)**:  
  A comprehensive guide on the Jenkins CI/CD pipeline, outlining the various stages, parameters, prerequisites, and tools used to automate the integration and deployment processes.

- **[Helm.md](./docs/Helm.md)**:  
  Instructions on how to deploy the MERN stack application using Helm, including installation, chart customization, and deployment of MongoDB, backend, and frontend services.

- **[ArgoCD.md](./docs/ArgoCD.md)**:  
  A step-by-step guide on installing, configuring, and using ArgoCD to deploy the application by Connecting ArgoCD to the GitHub repository.

- **[Observability.md](./docs/Observability.md)**:   
Instructions on setting up Prometheus for monitoring application metrics. Visualizing data with Grafana dashboards.

---
