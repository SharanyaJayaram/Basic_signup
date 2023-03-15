pipeline {

  agent any
    options { 
        timestamps ()
        timeout(time: 2, unit: 'MINUTES')   
        skipDefaultCheckout true
        buildDiscarder(logRotator(numToKeepStr: '2'))
    }
  stages {
    stage('Code checkout') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'gitcred', url: 'https://github.com/chaitanyapriya123/Basic_signup.git']])
      }
    }
      stage('Building image') {
      steps{
        //script {

       // }
      }
    }
    stage('Deploy Image to dockerhub') {
      steps{
        // sh 'dockerImage.push("latest")'

          }
      }
    }
    stage('Run the container'){
      steps{

      }
    }
 }
    post{
          success{
              sh 'echo "Container is up and running"'
          }
      }
      }
