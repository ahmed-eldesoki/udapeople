pipeline {
  environment {
        BUILD_NUMBER = "${env.BUILD_NUMBER}"
        MY_KUBECONFIG = credentials('kubernetescred')
    }
  agent {
    kubernetes {
      inheritFrom 'kube-2'
      defaultContainer 'alpine'

   }
  }
  stages {
    stage('checkout & build backend') {
            steps {
       
          git branch: 'jenkins', url: 'https://github.com/ahmed-eldesoki/udapeople.git'
     
          sh '''
                cd backend
                npm install
                npm run build
                ls -lh
                    '''
   }
  }
    stage('test & scan backend') {
            steps {
             script {
             try {
              sh '''
                cd backend
                npm run test
                    
                        '''
             }
             catch (err) {
                echo err.getMessage()
            }
            }
  }
  }
  stage('artifact') {
            steps {
            
            sh '''
            cd backend/
            tar -czf artifact${BUILD_NUMBER}.tar.gz * 
                    '''
   }
  }
  stage('check kubernetes') {
            steps {
                // withCredentials([string(credentialsId: 'kubernetescred', variable: 'FILE')]) {
                // sh 'echo $FILE > /home/jenkins/agent/workspace/k8s-agent-test/key'
                // }
                sh '''
                 kubectl --kubeconfig $MY_KUBECONFIG get pods
                 '''
            
    }
  }
  }
##test3

}