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
        
        /* Scanning files to verify wheter is error free or not */
        stage("TRIVY FS  SCAN"){
            steps{
                sh "trivy fs ."
            }
        }
        
        /* To Check Vulunerabilities and Code Smells through Sonarqube Scanner */
        stage('Sonarqube Analysis'){
            steps{
                sh 'mvn clean package -DskipTests=true '
                sh ''' mvn sonar:sonar \
                         -Dsonar.projectKey=Petclinic-Project \
                         -Dsonar.projectName='Petclinic-Project' \
                         -Dsonar.host.url=http://20.81.235.176:9000 \
                         -Dsonar.token=sqp_a572b78bdcb43ab940e2756c3f891591784be59d
                    '''
            }
        }
     
        /* Deploy war/jar/ear file through maven */
        stage('Deploy to Nexus'){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'spring-framework-petclinic', classifier: '', file: '/var/lib/jenkins/workspace/Petclinic-Project/target/petclinic.war', type: 'war']], credentialsId: 'Nexus', groupId: 'org.springframework.samples', nexusUrl: '20.81.235.176:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '5.3.13'
            }
        }
        
        /* Build the image and tag  */
        stage('Docker Build & Tag') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        
                        sh "docker build -t image1 ."
                        sh "docker tag image1 chinnayya339/pet-clinic123:v1.0.0 "
                
                    }
                }
            }
        }
        
        /* To Scan image to Find vulnerabilities in image */
        stage("TRIVY IMAGE SCAN"){
            steps{
                sh " trivy image chinnayya339/pet-clinic123:v1.0.0"
            }
        }
        
        /* Push tagged image into Docker-Hub and Deploy to Docker Container */
        stage('Docker Push & Deploy to Docker Container') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        
                        sh "docker push chinnayya339/pet-clinic123:v1.0.0"
                        sh "docker run --name Petclinic -d -p 8082:8082 chinnayya339/pet-clinic123:v1.0.0"
                        
                    }
                }
            }
        }
        
        /* Sending Build History to Email */
        stage('Email Trigger'){
             steps{
                 emailext(attachLog: true, attachmentsPattern: '*.csv', body: 'PetClinic-Project Buil History', compressLog: true, subject: 'PetClinic-Project Buil History', to: 'chinthayadav6@gmail.com,vennar456@gmail.com')
            }
        }
    }
}
