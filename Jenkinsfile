pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building image'
                dir ('NC2022') {
                      sh '''
                          docker build -t application-$BUILD_NUMBER .
                          docker tag application-$BUILD_NUMBER gcr.io/gifted-monitor-338716/application-$BUILD_NUMBER
                          gcloud docker push gcr.io/gifted-monitor-338716/application-$BUILD_NUMBER        
                      '''
                }
            }
        }
    }
}
