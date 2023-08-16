pipeline {
    agent any

    tools {
        // Define the Maven tool using its name
        maven 'M2_HOME' // Make sure 'Maven' matches the tool configuration in Jenkins
    }

    stages {
        stage('Git Checkout') {
            steps {
                // Corrected 'Git checkout' to 'git'
                git branch: 'feature-2', url: 'https://github.com/adedokunk/Petclinic.git'
            }
        }

        stage('Maven Compile') {
            steps {
                // Corrected 'Maven compile' to 'sh'
                sh 'mvn compile'
            }
        }

        stage('Maven Package') {
            steps {
                // Corrected 'Maven package' to 'sh'
                sh 'mvn package'
            }
        }
    }
}



