pipeline {
   environment {
    imagename = "sharanyajayaram/pythonproject"
    dockerImage = ''
  }
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
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SharanyaJayaram/Basic_signup.git']])
      }
    }
      stage('Building image') {
      steps{
       dockerImage = docker.build imagename
      }
    }
    stage('Deploy Image to dockerhub') {
      steps{
        script{
	      // dockerImage.push("latest")

          withCredentials([usernamePassword(credentialsId: 'dockerid', passwordVariable: 'dockeridPassword', usernameVariable: 'dockeridUser')]) {
            sh "docker login -u ${env.dockeridUser} -p ${env.dockeridPassword}"
            sh 'docker push sharanyajayaram/pythonproject:latest'
          }
        }
      }
    }
    stage('Run the container'){
      steps{
	      script{
      sh ''' docker pull sharanyajayaram/pythonproject:latest
      docker run -d -t -p 8000:8000 --name trialcont${BUILD_NUMBER} sharanyajayaram/pythonproject:latest
      docker stop --time=60 trialcont${BUILD_NUMBER}'''
      //docker system prune -af
	      }
	    
      }
    }
    }
    }
