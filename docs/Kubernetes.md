# Jenkins CI/CD Pipeline for MERN Stack Application

This guide explains the Jenkins pipeline used to automate the Continuous Integration (CI) and Continuous Deployment (CD) processes for the MERN stack application.

---

## Overview

The Jenkins pipeline is divided into two major components:

1. **Continuous Integration (CI) Pipeline**:
   - Handles code checkout from GitHub.
   - Runs security and code quality scans (Trivy, OWASP Dependency Check, SonarQube).
   - Builds Docker images for the frontend and backend applications.
   - Pushes the built Docker images to Docker Hub.

2. **Continuous Deployment (CD) Pipeline**:
   - Updates Kubernetes manifest files with the new Docker image tags.
   - Pushes the updated configurations back to GitHub.
   - Notifies the team via email about the build and deployment status.

---

## Key Stages in the CI Pipeline

### 1. **Workspace Cleanup**
   - Ensures that the workspace is clean before starting the build process.

### 2. **Code Checkout**
   - Retrieves the latest code from the GitHub repository.

### 3. **Security and Quality Scanning**
   - **Trivy**: Scans the project files for vulnerabilities.
   - **OWASP Dependency Check**: Analyzes project dependencies for known security issues.
   - **SonarQube**: Performs static code analysis to detect bugs, code smells, and vulnerabilities.

### 4. **Docker Image Build**
   - Builds Docker images for both the frontend and backend of the MERN application.
   - The built images are tagged with a version, making them easy to identify and manage.

### 5. **Push Docker Images to Docker Hub**
   - Tags the images using parameters (`FRONTEND_DOCKER_TAG` and `BACKEND_DOCKER_TAG`).
   - Pushes the tagged images to Docker Hub for future deployments.

---

## Key Stages in the CD Pipeline

### 1. **Verify Docker Image Tags**
   - Confirms that the correct Docker image tags for the frontend and backend have been provided.

### 2. **Update Kubernetes Manifests**
   - Updates the Kubernetes YAML files with the new Docker image tags for both the backend and frontend services.

### 3. **Git Push**
   - Commits the updated Kubernetes manifest files to the GitHub repository.

### 4. **Email Notification**
   - Sends a formatted email with the build and deployment status to the team, including links to the Jenkins build.

---

## Key Tools and Integrations

- **GitHub**: Version control system used to store and track the source code.
- **SonarQube**: Used for static code analysis.
- **Trivy**: A vulnerability scanner that analyzes files and containers.
- **OWASP Dependency Check**: Checks for vulnerabilities in third-party dependencies.
- **Docker**: Containerization technology used to build and deploy the MERN stack application.
- **Docker Hub**: A repository for hosting and managing Docker images.
- **Kubernetes**: Orchestrates the deployment of containers across a cluster.

---

## Usage

1. **CI Pipeline**: Triggers automatically when code is pushed to the repository, running tests, security scans, building Docker images, and pushing them to Docker Hub.
   
2. **CD Pipeline**: Triggers after successful CI execution. It updates the Kubernetes manifests with the new Docker image tags, pushes the changes to GitHub, and applies the new configurations to the Kubernetes cluster.

---