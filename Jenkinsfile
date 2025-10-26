pipeline {
    agent any

    tools {
        maven 'M3'       // Maven installation name in Jenkins
        jdk 'JDK21'      // Your configured JDK in Jenkins
    }

    environment {
        APP_NAME = 'EventManagementSystem'
        TOMCAT_HOME = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 11.0'
        WAR_NAME = 'EventManagementSystem.war'
        CONTEXT_PATH = '/EventManagementSystem'
        TOMCAT_CRED = 'tomcat-deploy-creds' // Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/ise_2.git'
            }
        }

        stage('Clean Old Deployment') {
            steps {
                echo "Cleaning old WAR and deployment..."
                bat """
                IF EXIST "%TOMCAT_HOME%\\webapps\\%WAR_NAME%" del /Q "%TOMCAT_HOME%\\webapps\\%WAR_NAME%"
                IF EXIST "%TOMCAT_HOME%\\webapps\\%APP_NAME%" rmdir /S /Q "%TOMCAT_HOME%\\webapps\\%APP_NAME%"
                """
            }
        }

        stage('Build') {
            steps {
                echo "Building WAR..."
                bat "mvn clean package"
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo "Deploying WAR to Tomcat..."
                bat """
                REM Create webapps folder if it doesn't exist
                IF NOT EXIST "%TOMCAT_HOME%\\webapps" mkdir "%TOMCAT_HOME%\\webapps"

                REM Copy WAR file
                copy /Y target\\EventManagementSystem-1.0-SNAPSHOT.war "%TOMCAT_HOME%\\webapps\\EventManagementSystem.war"
                """
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful!"
        }
        failure {
            echo "❌ Deployment Failed!"
        }
    }
}
