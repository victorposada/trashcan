pipeline {
    agent any

    tools {
        sonarQube 'sonarqube'
    }

    environment {
        SONAR_PROJECT_KEY = 'trashcan'
    }

    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/victorposada/trashcan.git'
            }
        }

        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube-eks-lab') {
                    sh "${tool('sonarqube')}/bin/sonar-scanner -Dsonar.projectKey=${env.SONAR_PROJECT_KEY}"
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    script {
                        def qg = waitForQualityGate()
                        if (qg.status != 'OK') {
                            error "Pipeline aborted due to quality gate failure: ${qg.status}"
                        }
                    }
                }
            }
        }
    }
}
