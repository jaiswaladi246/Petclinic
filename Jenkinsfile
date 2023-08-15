pipeline {
  agent any
  
  tools{
        maven 
        }
  
  stages {
    stage('Git Checkout') {
      steps {
        // Git checkout
        git branch: 'main', url: 'https://github.com/adedokunk/Petclinic.git'
      }
    }
    
    stage('Maven Compile') {
      steps {
        // Maven compile
        sh 'mvn compile'
      }
    }
    
    stage('Maven Package') {
      steps {
        // Maven package
        sh 'mvn package'
      }
    }
    
    stage('Deploy to Tomcat') {
      steps {
        // Deploy to Tomcat
        sh 'sudo cp -r target/petclinic.war * /opt/apache-tomcat-9.0.65/webapps'
      }
    }
  }
}
