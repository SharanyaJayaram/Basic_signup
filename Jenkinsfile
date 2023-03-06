pipeline {
	agent any
	stages {

		stage('Python Build') {
			steps{
				timeout(time: 2, unit: 'MINUTES'){
				sh 'python3 manage.py migrate'
				sh 'python3 manage.py runserver 0.0.0.0:8000'
				}
			}

		}

		stage('stop server') {
			steps {
				sh 'pid=$(lsof -i :8000 -t) && [ -n "$pid" ] && kill $pid'
			}

		}
	}
}
