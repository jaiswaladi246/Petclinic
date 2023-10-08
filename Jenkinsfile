pipeline {
    agent any
    
    /* Particular Version Recommended to Use in Project */
    tools{
        jdk  'jdk17'
        maven  'maven3'
    }

    stages {
        
        /* Clone the code from https://github.com/chinnayyachintha/Ekart/tree/main*/
        stage('SCM') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/chinnayyachintha/Petclinic-Project.git']])
            }
        }
        
        /* Compile source code and skip Test cases why? because in this project we will get error */
        stage('COMPILE') {
            steps {
                sh "mvn clean compile "
            }
        }
        
        /* OWASP Dependency Check is a software composition analysis (SCA) tool that identifies project dependencies with known vulnerabilities */
        stage('OWASP Dependency Check') {
            steps {
                dependencyCheck additionalArguments: '--scan target/', odcInstallation: 'Dependency-Check'
            }
        }
        
        /* Publish report in the form xml/html */
        stage('Publish OWASP Dependency Check Report') {
            steps {
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
    }
}
