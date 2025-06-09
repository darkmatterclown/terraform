pipeline {
    agent label ''

    environment {
       AWS_CREDENTIALS_ID = credentials'394ca990-960f-42bd-b9e7-6af5a8dea834'  // Replace with actual AWS credential ID
    }

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Terraform action')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/harris-97/jenkins-terraform-test.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve tfplan'
                    } else {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
