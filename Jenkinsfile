pipeline{
  agent any
  stages{
    stage('Automate infrastructure with Terraform)'){
      steps{
        sh "bash scripts/terraform.sh"
      }
    }
    stage('Ansible Install & Verify (Also installs docker)'){
      steps{
        sh "bash scripts/ansible.sh"
      }
    } 
	stage('Deploy'){
      steps{
        sh "bash scripts/deploy.sh"
      }
    } 
  }
 }