pipeline {
    agent any
    stages {
        stage('Build Application') {
            steps {
                sh 'mvn -f pom.xml clean package'
            }
            post {
                success {
                    echo "Now Archiving the Artifacts...."
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }

        stage('Create Tomcat Docker Image'){
            steps {
                sh "pwd"
                sh "ls -a"
                sh "docker build . -t tomcatsamplewebapp:${env.BUILD_ID}"
            }
        }
        
        stage('Push image') {
		    steps {
			    script {
				    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
					    sh "docker login -u giitcodes -p ${dockerhub}"
				    }
				    app.push("${env.BUILD_ID}")
			    }
			}
        }
}
