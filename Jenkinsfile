pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-node-app"
        CONTAINER_NAME = "running-node-container"
        PORT = "3000"
    }

    stages {
        stage('Clean Old Deployment') {
            steps {
                script {
                    echo 'Stopping and cleaning up any old running versions of the app...'
                    // Check if the container is running and stop it safely
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building fresh production-ready Docker image...'
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Deploy Application Container') {
            steps {
                echo 'Spinning up live application container...'
                sh "docker run -d -p ${PORT}:${PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest"
                echo 'Deployment successful!'
            }
        }
    }
}
