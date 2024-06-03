pipeline{
    agent none

    environment{
        BUILD_SERVER='ec2-user@172.31.40.79'
        IMAGE_NAME='devopstrainer/java-mvn-privaterepos:php$BUILD_NUMBER'
    }

    stages{
        stage('Build dockerimage and push to dockerhub'){
            agent any
            steps{
                script{
                    sshagent(['slave2']){
                         withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                        sh "scp -o StrictHostKeyChecking=no -r build-config ${BUILD_SERVER}:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVER} bash /home/ec2-user/build-config/docker-script.sh ${IMAGE_NAME}"
                        sh "ssh ${BUILD_SERVER} sudo docker login -u $USERNAME -p $PASSWORD"
                         sh "ssh ${BUILD_SERVER} sudo docker push ${IMAGE_NAME}"
 
                    }
                }
            }
        }
    }
}

}
