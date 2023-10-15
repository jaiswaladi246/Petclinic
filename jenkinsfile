pipeline {
    agent any
    
    tools{
        jdk 'jdk11'
        maven 'maven'
        }

    stages {
        stage('Git Checkout') {
            steps {
              git branch: 'main', url: 'https://github.com/amsrikanth/Petclinic.git'
            }
        }    
            stage('compile') {
            steps {
              sh "mvn clean compile"
            }
        }
        
        stage('Build') {
            steps {
              sh "mvn clean package -DskipTests=true"
            }
        } 
    }
}
