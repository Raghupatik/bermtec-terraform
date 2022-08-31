pipeline {
  agent any

  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
  }

  environment {
    varfile= "${params.file}"
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
  }

  stages {
    stage('Init') {
      steps {
        sh "terraform init"
      }
    }

    stage('plan') {
      steps {
        sh "terraform plan -var-file='${varfile}'"
      }
    }

    stage('apply') {
      steps {
        input 'Apply Plan'
        sh "terraform apply -var-file='${varfile}'"
      }
    }
  }
}