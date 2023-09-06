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
                git branch: 'test', changelog: false, poll: false, url: 'https://github.com/Reddy999eee/Petclinic.git'
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
       stage ('Install') {
           steps{
              sh 'mvn clean install'
                   }
             }
        
        stage ('Clean WS') {
            steps{
                cleanWs()
            }
        }
    }
}

