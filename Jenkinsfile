pipeline{
  agent any
  stages{
    stage('Ansible Install & Verify (Also installs docker)'){
      steps{
        sh "bash scripts/ansible.sh"
      }
    } 
  }
}