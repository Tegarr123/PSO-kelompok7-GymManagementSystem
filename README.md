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

- **Frontend**: Jinja2, Flask.
- **Backend**: Flask, Flask-SQLAlchemy, Flask-SQLAlchemy, WTForms, Passlib, pytest.
- **Database**: MySQL.
- **DevOps**: Integrated CI/CD pipelines using Git/GitHub for version control, Docker for containerization, Jenkins for CI/CD pipeline prototyping, Kubernetes for deployment, AWS for setting cloud environment, etc.

### System Requirements

- **Server**: Minimum 2 GHz processor, 4 GB RAM.
- **Database**: 100 GB storage (for tracking member details and progress).

### Installation & Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Tegarr123/PSO-kelompok7-GymManagementSystem.git
   cd gym-management-system
   ```

2. **Install dependencies**:

   ```bash
   npm install  # or pip install -r requirements.txt (for Python backend)
   ```

3. **Run the application**:

   ```bash
   npm start  # or python manage.py runserver
   ```

4. **Access the application**:  
   Open [http://10.25.128.118:5000](http://10.25.128.118:5000) in your browser.

### CI/CD Pipeline

The project uses automated CI/CD pipelines for streamlined deployments:

- **Code Testing**: Unit tests are automatically triggered on every push to the `master` branch.
- **Docker Builds**: Docker images are built from the source code and pushed to a container registry.
- **Kubernetes Deployment**: The application is deployed or updated in a Kubernetes cluster using a rolling update strategy to ensure minimal downtime.

### Monitoring

- **Logs**: Application logs are collected, stored, and visualized using the **ELK Stack** (Elasticsearch, Logstash, and Kibana). This ensures easy access and analysis of logs for debugging and monitoring.
- **Performance Metrics**: Key metrics such as CPU usage, memory consumption, and request handling times are tracked using **Prometheus**. These metrics are visualized in **Grafana** dashboards for real-time monitoring and long-term analysis.
