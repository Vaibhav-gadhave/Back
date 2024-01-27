pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('Jenkins')
  }
  stages {
    stage('Building Docker Image') {
      steps {
        sh 'docker build -t vvgadhave/ubuntu-gui:v1 .'
      }
    }
    stage('Login Into Docker') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push Image to Hub') {
      steps {
        sh 'docker push vvgadhave/ubuntu-gui:v1'
      }
    }
  }
}

