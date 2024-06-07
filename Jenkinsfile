pipeline {
    agent any

    tools {
        nodejs "NodeJS LTS"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/fernandoromero91/utn-devops-app-back.git'
            }
        }
        stage('Build') {
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
