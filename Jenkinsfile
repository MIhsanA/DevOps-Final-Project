pipeline{
    agent any
    stages {
        stage('Script Executable') {
            steps {
               sh "chmod +x ./scripts/*"
                  }
        }
        stage('Build') {
            steps{
                sh './scripts/build.sh'
                sh './scripts/ansible.sh'
            }
           }
        stage('Depoly') {
            steps{
                sh './scripts/deploy.sh'   
            }}
           }   
}
