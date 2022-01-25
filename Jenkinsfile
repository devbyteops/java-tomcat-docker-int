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

        stage('Login to Docker'){
            steps {
                sh "docker login -u giitcodes -p ${dockerhub}"
            }
        }

        stage('Push Image'){
            steps {
                sh "docker push giitcodes/java-tomcat:${env.BUILD_ID}"
            }
        }
    }

    post {
        always {
            sh "docker logout"
        }
    }
}
