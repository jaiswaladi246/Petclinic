pipeline {
    agent any
    tools {
        jdk 'jdk17'
        maven 'maven3.6'
    }
    
    environment {
        SCANNER_HOME= tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Reddy999eee/Petclinic.git'
            }
        }
        stage('Compile') {
            steps {
                sh "mvn compile"
            }
        }
        
        stage('Unit Test') {
            steps {
                sh "mvn install"
            }
        }
        stage ('Sonar Analysys') {
            steps {
               withSonarQubeEnv(credentialsId: 'Sonar_Cred', installationName: 'sonar-scanner') {
                  sh "mvn sonar:sonar"
                }

            }
        }
        
       stage('OWASP Scan') {
            steps {
                dependencyCheck additionalArguments: ' --scan ./ ', odcInstallation: 'DP-check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        
        
        stage ('Docker Tag & Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: '16f75b5c-c825-4163-8890-28e174b31deb', toolName: 'docker'){
                        sh "docker build -t petclinic ."
                        sh "docker tag petclinic nsivareddy/pet-clinic:latest"
                        sh "docker push nsivareddy/pet-clinic:latest"
                    }
                }
               
            }
        }
        
        stage('Docker Deploy') {
            steps {
                sh " docker run -d --name Pet-Clinic -p 8082:8082 nsivareddy/pet-clinic:latest "
            }
        }
        
        stage ('Clean WS') {
            steps{
                cleanWs()
            }
        }
    }
}

