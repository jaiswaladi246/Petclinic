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
    }
    
    stage('Maven Package') {
      steps {
         Maven package
        sh 'mvn package'
      }
    }
    
  }
 }
      
  
 
   



