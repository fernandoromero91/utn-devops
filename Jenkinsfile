pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/fernandoromero91/utn-devops-app-back.git'
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'node:lts'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
    }
}