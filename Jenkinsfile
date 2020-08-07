pipeline{
  agent any
  stages{
    stage('Ansible Install & Verify (Also installs docker)'){
      steps{
        sh "bash scripts/ansible.sh"
      }
    } 
  }
    stage('Deploy'){
      steps{
        sh "bash scripts/deploy.sh"
      }
    } 
}