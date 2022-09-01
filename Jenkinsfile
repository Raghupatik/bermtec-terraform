pipeline {
  agent any

  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
    string(description: 'storage account to store tfstate', name: TF_BACKEND_ACCOUNT)
  }

  environment {
    varfile= "config/${params.ENVIRONMENT}.tfvars"
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
    TF_BACKEND_ACCOUNT = "${params.TF_BACKEND_ACCOUNT}"
    TF_BACKEND_KEY = "${params.ENVIRONMENT}/terraform.tfstate"
  }

  stages {
    stage('Init') {
      steps {
        sh "terraform init"
        echo 'Initialization done'
      }
    }

    stage('plan') {
      steps {
        sh "terraform plan -var-file='${varfile}'"
        echo 'plan done'
      }
    }

    stage('apply') {
      steps {
          input 'Apply ?'
          sh "terraform apply -var-file='${varfile}' --auto-approve"
          echo 'Apply done'
      }
    }

     stage('destroy') {
      steps {
        input 'Destroy ?'
        sh "terraform destroy -var-file='${varfile}' --auto-approve"
        echo 'Destroy done'
      }
    }
  }
}