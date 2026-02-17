pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'rishuagrawal1309/calculator'
        GITHUB_REPO_URL = 'https://github.com/rishuagrawal1309/Calculator-Microservice.git'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: "${GITHUB_REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}", ".")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DockerHubCred') {
                        docker.image("${DOCKER_IMAGE_NAME}").push('latest')
                    }
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook -i inventory deploy.yml'
            }
        }
    }
}

