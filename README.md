# Gym Management System

The **Gym Management System** is a web-based application designed to streamline gym operations, making it easier for gym owners, staff, trainers, and members to manage daily activities and information efficiently.

## 🚀 Features at a Glance

- Simplifies member management, workout tracking, and gym operations.
- Centralized database for managing personal info, workout plans, progress stats, and equipment inventory.
- Role-based access control for **Admins**, **Gym Members**, **Trainers**, and **Receptionists**.

## 🎯 Who Is It For?

- **Gym Members**: Access personal workout plans, track progress, and manage personal details.
- **Admin**: Manage staff, members, and gym resources.
- **Receptionists**: Handle member registrations and basic queries.
- **Trainers**: Create workout plans and track member progress.

## 🛠️ Core Functionalities

### 🧑‍💼 Admin

Admins can:

- Manage staff: Add or remove **Receptionists** and **Trainers**.
- Manage members: Add or delete **Gym Members**.
- Oversee operations: View details of all users (members, staff, and trainers).
- Manage resources: Add or remove gym equipment.

### 🏋️‍♂️ Gym Members

Members can:

- Log in to view **workouts**, **goals**, and **diet plans**.
- Track progress by entering daily training stats.
- Update personal details (e.g., contact info).
- Access trainer details.

### 🏋️‍♀️ Trainers

Trainers can:

- Design and assign **workout plans**.
- Track progress of assigned members.
- Update personal information.
- View available gym equipment.

### 🛎️ Receptionist

Receptionists can:

- Register new gym members.
- Remove members when they leave.
- Access contact details of all users.

## 🌐 Technical Overview

### Tech Stack

- **Frontend**: Jinja2, html, css, bootstrap.
- **Backend**: Flask, Flask-mysqldb, WTForms, Passlib, pytest.
- **Database**: MySQL.
- **DevOps Tools**: Docker, Jenkins, ArgoCD, Terraform, Kubernetes.
- **Monitoring**: Grafana, Prometheus.

### Installation & Setup

- Minikube (kuberenetes) installation documentation : https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download
- Jenkins Installation : https://www.jenkins.io/doc/book/installing/
- Docker Installation : https://docs.docker.com/engine/install/
- Kubectl Installation : https://kubernetes.io/docs/tasks/tools/
- Script for GitOps : https://github.com/Tegarr123/GymManagementSystem-GitOps

1. clone the repository
2. make sure you've installed Jenkins, minikube, Docker, and kubectl in your system using following command
   ```bash
   jenkins --version
   docker --version
   minikube --status
   kubectl version
   ```
3. Install ArgoCD
   1. create argocd namespace
   ```bash
   kubectl create namespace argocd
   ```
   2. apply yaml configuration and installation for argoCD
   ```bash
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```
   3. verify that argoCD pods have been created
   ```bash
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```
   4. Expose argoCD
   ```bash
   kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
   ```
   5. wait about 5 minute for node creation & run following command to open argoCD
   ```bash
   minikube service argocd-server -n argocd
   ```
   6. get the secret password for argoCD by executing following command and copy the password
   ```bash
      kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
   ```
   7. Login argoCD account with **admin** username and password you've got from step 6

### Web Deployment with argoCD & kubernetes

1.  Apply the yaml app configuration file

```bash
kubectl apply -f gymmgmt-application.yaml
```

7.  wait about 15 minutes for node creation
8.  run following command to open the web app

```bash
minikube service gymmgmt-service -n gym-app
```
