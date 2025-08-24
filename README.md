MEAN Stack Application Deployment with Docker, Nginx & GitHub Actions

This repository contains a MEAN (MongoDB, Express, Angular, Node.js) application, fully containerized with Docker and deployed automatically using GitHub Actions CI/CD. The project demonstrates containerization, reverse proxy setup, and automated deployment to a cloud-based Ubuntu VM.

---

Table of Contents
- Overview
- Architecture
- Project Structure
- Running Locally
- CI/CD Pipeline
- GitHub Secrets
- Deployment on VM
- Deliverables
- License

---

Overview

- Frontend: Angular application served via Nginx  
- Backend: Node.js with Express REST API  
- Database: MongoDB (containerized)  
- Containerization: Docker & Docker Compose  
- CI/CD: GitHub Actions for build, push, and deployment  
- Reverse Proxy: Nginx configured for SPA routing and API proxy  

The Angular frontend is built and served via Nginx.  
Nginx also acts as a reverse proxy for backend API requests.  
MongoDB is containerized and linked with the backend service.

---

Project Structure

crud-dd-mean/
├─ frontend/ (angular)                 
│  ├─ Dockerfile
│  ├─ nginx.conf
│  └─ (existing src, angular.json, package.json, ...)
├─ backend/ (express api)
│  ├─ Dockerfile
│  └─ (existing src, package.json, ...)
├─ deploy/
│  ├─ docker-compose.yml
│  ├─ .env.example
│  └─ nginx/
│     └─ default.conf
├─ .github/
│  └─ workflows/
│     └─ ci-cd.yml

---

Running Locally

1. Clone the repository:
   git clone https://github.com/<your-username>/mean-app.git
   cd mean-app

2. Build and start containers:
   docker compose up -d --build

3. Access the application:
   Frontend: http://localhost  
   Backend API: http://localhost:3000  
   MongoDB: mongodb://localhost:27017  

4. Stop services:
   docker compose down

---

CI/CD Pipeline

The GitHub Actions workflow (.github/workflows/ci-cd.yml) automates the following:

1. Checkout repository  
2. Log in to Docker Hub using GitHub Secrets  
3. Build and push Docker images for backend and frontend  
4. Connect to VM via SSH and deploy using Docker Compose  

---

GitHub Secrets

The following secrets must be configured in the repository:

REGISTRY_USER   → Docker Hub username  
REGISTRY_PASS   → Docker Hub password or access token  
DEPLOY_SSH_KEY  → Private SSH key for VM authentication  
VM_HOST         → Public IP or hostname of VM  
VM_USER         → Username for VM (e.g., ubuntu)  

---

Deployment on VM

1. Provision an Ubuntu VM on AWS, Azure, or GCP.  
2. Install Docker and Docker Compose:
   sudo apt update  
   sudo apt install -y docker.io docker-compose-plugin  

3. Clone the repository:
   git clone https://github.com/<your-username>/mean-app.git  
   cd mean-app  

4. Deploy with Docker Compose:
   docker compose up -d  

5. Subsequent deployments are handled automatically by GitHub Actions when changes are pushed to the main branch.  

---

Deliverables

- Dockerfiles for frontend and backend  
- Docker Compose configuration  
- Nginx reverse proxy setup  
- GitHub Actions CI/CD workflow  
- Documentation (this README)

- Architecture Diagram
- ![WhatsApp Image 2025-08-24 at 16 25 39_f874edf6](https://github.com/user-attachments/assets/839de1a2-e1f9-4ce8-b671-cabbffb556bf)
- ![WhatsApp Image 2025-08-24 at 16 46 21_57d075a7](https://github.com/user-attachments/assets/656fc0cf-9440-47f3-bafb-4b756a0d6d18)
- ![WhatsApp Image 2025-08-24 at 16 46 21_d9339004](https://github.com/user-attachments/assets/2179e507-b8fa-41fb-9716-39cb7bfdb54c)


