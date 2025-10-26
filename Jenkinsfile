pipeline {
    agent any

    tools {
        maven 'M3'       // Maven installation name in Jenkins
        jdk 'JDK21'      // Your configured JDK in Jenkins
    }

    environment {
        APP_NAME = 'EventManagementSystem'
    }

    stages {
        // 1️⃣ Checkout Code from GitHub
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/ise_2.git'
            }
        }

        // 2️⃣ Build with Maven
        stage('Build') {
            steps {
                // Use Windows batch command
                bat "mvn clean package"
            }
        }

        // 3️⃣ Deploy to Tomcat
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat(
                    url: 'http://localhost:8080/manager/text',
                    credentialsId: 'tomcat-deploy-creds'
                )],
                contextPath: "/EventManagementSystem",
                war: "**/target/EventManagementSystem.war"
            }
        }
    }

    // 4️⃣ Post Actions
    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
