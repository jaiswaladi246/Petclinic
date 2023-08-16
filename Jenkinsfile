pipeline {
  agent any
  
  tools{
        maven 'M2_HOME'
        }
  
  stages {
    stage('Git Checkout') {
      steps {
         Git checkout
        git branch: 'feature-2', url: 'https://github.com/adedokunk/Petclinic.git'
      }
    }
    
    stage('Maven Compile') {
      steps {
         Maven compile
        sh 'mvn compile'
      }
  
    
    stage('Maven Package') {
      steps {
         Maven package
        sh 'mvn package'
      }


    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'feature-2', url: 'https://github.com/jaiswaladi246/Petclinic.git'
            }
        }
        
        stage('Compile') {
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
 }
      
  
 
   



