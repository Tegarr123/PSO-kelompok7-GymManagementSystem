pipeline {
    agent any
    environment {
        USERNAME = 'raflikr'
        IMAGE_NAME = 'gym-management-system-app'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'branch-rafli', credentialsId: 'github', url: 'https://github.com/Tegarr123/PSO-kelompok7-GymManagementSystem.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${USERNAME}/${IMAGE_NAME}:latest ."
            }
        }
        stage('Test Flask Application') {
            steps {
                sh "docker run ${USERNAME}/${IMAGE_NAME}:latest pytest tests/"
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([ credentialsId: 'dockerhub', url: '' ]) {
                    sh "docker push ${USERNAME}/${IMAGE_NAME}:latest"
                }
            }
        }
    }
}

stage('Deploy to Server') {
    steps {
        sh """
        ssh -i /path/to/private-key.pem user@your-server-ip << EOF
        docker pull ${USERNAME}/${IMAGE_NAME}:latest
        docker stop gym-app || true
        docker rm gym-app || true
        docker run -d --name gym-app -p 5000:5000 ${USERNAME}/${IMAGE_NAME}:latest
        EOF
        """
    }
}

