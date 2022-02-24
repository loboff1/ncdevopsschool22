pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building docker image'
                dir ('NC2022') {
                      sh '''
                          docker build -t ncdevreg.ml:5000/application-$BUILD_NUMBER .
                      '''
                }
            }
        }
        stage('Push docker image to local registry') {
            steps {
                echo 'Start push docker image'
                withCredentials([usernamePassword(credentialsId: 'localregistry', passwordVariable: 'localregistryPassword', usernameVariable: 'localregistryUser')]) {
                      sh '''
                          docker login https://ncdevreg.ml:5000 -u ${env.localregistryUser} -p ${env.localregistryPassword}
                          docker push ncdevreg.ml:5000/application-$BUILD_NUMBER
                      '''
                }
            }
      }
   }
}
