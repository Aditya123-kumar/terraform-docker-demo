
pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        timestamps()
        disableConcurrentBuilds()
    }

    environment {
        TF_IN_AUTOMATION = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init -input=false'
            }
        }

        stage('Terraform Format Check') {
            steps {
                bat 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -input=false -var-file=terraform.tfvars.example -out=jenkins.tfplan'
            }
        }
    }

    post {
        success {
            echo 'Terraform validation and plan completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the console output.'
        }
        always {
            bat 'if exist jenkins.tfplan del /q jenkins.tfplan'
        }
    }
}