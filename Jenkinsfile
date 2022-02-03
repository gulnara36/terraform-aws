pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                    git branch: 'main', url: 'git@github.com:gulnara36/terraform-aws.git'
                }
            }

        stage ('Test') {
            steps {
                script{
                    sh "chmod +x -R ${env.WORKSPACE}/../${env.JOB_NAME}/pipeline.sh"
                }
            }
        }
    }
}
