pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
    }
   
    stages {
        stage('Git Checkout') {
            steps {
                // Get some code from a GitHub repository
             checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'gitCredentials', url: 'https://github.com/MadeJavaEasy-Devops/ingestion-utility/']])
                   }
        }
        stage('Maven Build') {
            steps {
                 // build the artifact
                sh 'mvn clean package -DskipTests'
                sh 'java -version'
            }
        }
        stage('Docker Build') {
            steps {
              script{
                sh 'docker build -t madeeasyjava/ingestion-utility .'
                }
            }
        }
          stage('Docker Image Deployment') {
            steps {
              script{
               withCredentials([string(credentialsId: 'dockerID', variable: 'dockerhubToken')]) {
               sh 'docker login -u madeeasyjava -p ${dockerhubToken}'
               }
               sh 'docker push madeeasyjava/ingestion-utility'
                }
            }
        }
          stage('deploy to k8s') {
            steps {
              script{
              withKubeConfig([credentialsId: 'K8SID', serverUrl: 'https://ap-south-1.console.aws.amazon.com/ec2/home?region=ap-south-1']) {
               sh 'kubectl get pods'
               sh 'kubectl apply -f ingestion-utility-k8s-manifest.yml'
                }
              }
            }
        }
    }
}
