pipeline {
    agent  any

    environment {
       AWS_CREDENTIALS_ID = credentials ('c6ad4006-55ba-4959-8221-e0c13cc79c21')  // Replace with actual AWS credential ID
    }

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Terraform action')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/darkmatterclown/terraform.git'
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
