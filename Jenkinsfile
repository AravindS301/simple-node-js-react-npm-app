pipeline {
    agent any

    environment {
        IMAGE_NAME = 'aravindsivaprakasam/react-app'
    }

    stages {
        stage('Code Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-pat',
                    url: 'https://github.com/AravindS301/simple-node-js-react-npm-app'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Publish to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker tag $IMAGE_NAME:latest $DOCKER_USER/react-app:latest
                        docker push $DOCKER_USER/react-app:latest
                    '''
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'kubectl apply --validate=false -f k8s_manifest/'
            }
        }

        stage('Send Notification to your email ID') {
            steps {
                echo 'Deployment completed successfully'
            }
        }
    }
}
