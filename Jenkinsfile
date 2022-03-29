pipeline {
    agent none
    environment {
        IMG_REVISION="1.0.0"
        IMG_NAME='jenkins-hello'
    }
    stages {
        stage('Building') {
            agent any
            steps {
                
                // Build our current image
                sh "docker build -t ${IMG_NAME}:${IMG_REVISION}-${BUILD_ID} ."
            }
        }
        stage('Deploying') {
            agent any
            steps {
                dir(path: env.BUILD_ID) {
                    sh "docker tag ${IMG_NAME}:${IMG_REVISION}-${BUILD_ID} ${IMG_NAME}:latest"
                    sh "docker-compose up -d"
                }
            }
            post {
                success {
                    echo 'Deployment successful'
                }
            }
        }
    }
}

                