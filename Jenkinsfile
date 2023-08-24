pipeline {
    agent any
    
    tools{
        jdk "jdk11"
        maven "maven3"
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/bbnp1980/Petclinic.git'
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
        
         stage('Deploy') {
            steps {
               sh "sudo cp target/petclinic.war /opt/apache-tomcat-9.0.65/webapps"  
            }
        } 
        
         stage('Build') {
            steps {
               sh "mvn clean package -DskipTests=true"  
            }
        } 
    }
}
