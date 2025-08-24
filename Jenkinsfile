pipeline {
    agent any

    environment {
        DOCKERHUB_USER = credentials('dockerhub-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/<your-username>/<your-repo>.git'
            }
        }

        stage('Build Backend Image') {
            steps {
                sh '''
                docker build -t ${DOCKERHUB_USER_USR}/mean-backend:latest ./backend
                '''
            }
        }

        stage('Build Frontend Image') {
            steps {
                sh '''
                docker build -t ${DOCKERHUB_USER_USR}/mean-frontend:latest ./frontend
                '''
            }
        }

        stage('Push Images') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push ${DOCKER_USER}/mean-backend:latest
                    docker push ${DOCKER_USER}/mean-frontend:latest
                    '''
                }
            }
        }

        stage('Deploy to VM') {
            steps {
                sshagent(['vm-ssh-key']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ubuntu@<VM-IP> '
                      cd ~/crud-dd-task-mean-app || git clone https://github.com/<your-username>/<your-repo>.git ~/crud-dd-task-mean-app;
                      cd ~/crud-dd-task-mean-app;
                      git pull;
                      export DOCKERHUB_USERNAME=${DOCKERHUB_USER_USR};
                      docker compose pull || docker-compose pull;
                      docker compose up -d || docker-compose up -d;
                    '
                    '''
                }
            }
        }
    }
}
