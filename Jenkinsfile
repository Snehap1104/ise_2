pipeline {
    agent any

    environment {
        APP_NAME = 'EventManagementSystem'
    }

    tools {
        maven 'M3'  // Use the Maven installation you configured in Jenkins
        jdk 'JDK21' // Make sure you have JDK configured in Jenkins (optional)
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/ise_2.git'
            }
        }

        stage('Build') {
            steps {
                sh "mvn clean package"   // Linux/Mac
                // bat "mvn clean package" // Windows, uncomment if using Windows agent
            }
        }

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

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
