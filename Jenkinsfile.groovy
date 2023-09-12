pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform configurations and OPA policies from Git
                git url: 'https://github.com/your-org/terraform-config.git'
                git url: 'https://github.com/your-org/opa-policies.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform in the working directory
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                // Generate a Terraform plan
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('OPA Policy Check') {
            steps {
                // Check Terraform plan against OPA policies
                script {
                    sh 'opa eval -d policies/ --input tfplan terraform/main'
                }
            }
        }

    }
}
