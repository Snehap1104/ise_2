pipeline {
    agent any

    tools {
        maven 'M3'       // Maven installation name in Jenkins
        jdk 'JDK21'      // Your configured JDK in Jenkins
    }

    environment {
        APP_NAME = 'EventManagementSystem'
        TOMCAT_HOME = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 11.0' // Correct Tomcat path
        WAR_NAME = 'EventManagementSystem.war'
        CONTEXT_PATH = '/EventManagementSystem'
        TOMCAT_CRED = 'tomcat-deploy-creds' // Jenkins credentials ID
    }

    stages {
        // 1️⃣ Checkout code
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/ise_2.git'
            }
        }

        // 2️⃣ Clean old deployment
        stage('Clean Old Deployment') {
            steps {
                echo "Cleaning old WAR and deployment..."
                bat """
                IF EXIST "%TOMCAT_HOME%\\webapps\\%WAR_NAME%" del /Q "%TOMCAT_HOME%\\webapps\\%WAR_NAME%"
                IF EXIST "%TOMCAT_HOME%\\webapps\\%APP_NAME%" rmdir /S /Q "%TOMCAT_HOME%\\webapps\\%APP_NAME%"
                """
            }
        }

        // 3️⃣ Build WAR with Maven
        stage('Build') {
            steps {
                echo "Building WAR..."
                bat "mvn clean package"
            }
        }

        // 4️⃣ Deploy to Tomcat
        stage('Deploy to Tomcat') {
            steps {
                echo "Deploying WAR to Tomcat..."
                bat """
                copy /Y target\\EventManagementSystem-1.0-SNAPSHOT.war "%TOMCAT_HOME%\\webapps\\%WAR_NAME%"
                
                REM Stop and start Tomcat to deploy the WAR
                "%TOMCAT_HOME%\\bin\\shutdown.bat"
                "%TOMCAT_HOME%\\bin\\startup.bat"
                """
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful! Access at http://localhost:8080%CONTEXT_PATH%"
        }
        failure {
            echo "❌ Deployment Failed!"
        }
    }
}
