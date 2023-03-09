pipeline {
//   environment {
//     imagename = "sharanyajayaram/trialpython"
//     dockerImage = ''
//   }
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
        sh 'docker build -t shrth7/devops .'
       // }
      }
    }
    stage('Deploy Image to dockerhub') {
      steps{
        // sh 'dockerImage.push("latest")'
          withCredentials([usernamePassword(credentialsId: 'dockerid', passwordVariable: 'dockeridPassword', usernameVariable: 'dockeridUser')]) {
            sh "docker login -u ${env.dockeridUser} -p ${env.dockeridPassword}"
            sh 'docker push shrth7/devops:latest'
          }
      }
    }
    stage('Run the container'){
      steps{
      sh '''docker pull shrth7/devops:latest"
      docker run -d -t -p 8000:8000 --name trialcont${BUILD_NUMBER} shrth7/devops:latest
      docker stop --time=60 trialcont${BUILD_NUMBER}
      docker system prune -af'''
      }
    }
 }
    post{
          success{
              sh 'echo "Container is up and running"'
          }
      }
      }
