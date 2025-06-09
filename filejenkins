pipeline {
    agent { label 'agent-ec2' }

    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Terraform action to perform'
        )
    }

    environment {
        AWS_DEFAULT_REGION = 'us-east-1' // Change as needed
        AWS_CREDENTIALS = credentials('394ca990-960f-42bd-b9e7-6af5a8dea834') //Replace with your Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/harris-97/jenkins-terraform-test.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
        stage('Terraform state'){
            steps {
                sh 'terraform state list'
                }
        }

    }
     

    post {
        always {
            cleanWs()
        }
    }
}
