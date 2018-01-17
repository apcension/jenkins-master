pipeline {
  agent {
    label 'swarm-agent'
  }
  environment {
     PROJECT_NAME = "jenkins-master"
     REGISTRY = "registry.apcension.net"
  }
  stages {
    stage('Docker Build') {
      steps {
        script {
          echo "Live Demo2"
          DOCKER_IMAGE = "${REGISTRY}/${PROJECT_NAME}"
          sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} -t ${DOCKER_IMAGE}:latest ."
        }
      }
    }

    stage('Push to Registry') {
      steps {
       sh """
           docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}
           docker push ${DOCKER_IMAGE}:latest
        """
        echo "Push Complete!"
      }
    }
  }
}

