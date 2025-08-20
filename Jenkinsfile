pipeline {
    environment {
        registry = "sachin200007/cicdrepo"
        registryCredentials = 'docker-credentials'
    }

    agent any

    stages {
        stage('Clone a git repository') {
            steps {
                git credentialsId: 'git-credentials', url: 'https://github.com/sachinee2000/flask-ner-pipeline-.git'
            }
        }

        stage('Build a docker image') {
            steps {
                sh 'echo build a docker image'
                script {
                    builddate = new Date()
                    image = docker.build("${registry}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push docker image to registry') {
            steps {
                sh 'echo push docker image to registry'
                script {
                    docker.withRegistry('', registryCredentials) {
                        image.push()
                        image.push('latest')
                    }
                }
            }
        }
    }
}
