pipeline {
  environment {
     
        KUBECONFIG = credentials('kubernetescred')
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
//     stage('test & scan backend') {
//             steps {
//              script {
//              try {
//               sh '''
//                 cd backend
//                 npm run test
                    
//                         '''
//              }
//              catch (err) {
//                 echo err.getMessage()
//             }
//             }
//   }
//   }
  stage('artifact') {
            steps {
            
            sh '''
            cd backend/
            tar -czf artifact.tar.gz * 
                    '''
   }
  }
//   stage('check kubernetes') {
//             steps {
//                 // withCredentials([string(credentialsId: 'kubernetescred', variable: 'FILE')]) {
//                 // sh 'echo $FILE > /home/jenkins/agent/workspace/k8s-agent-test/key'
//                 // }
//                 sh '''
//                  kubectl  get pods
//                  '''
            
//     }
//   }
//   stage('building docker image') {
           
//       steps {         
              
//         script {
//      dockerImage = docker.build("ahmedeldesoki/udabackend:${BUILD_NUMBER}", "./backend")
//       withDockerRegistry([ credentialsId: "docker-hub", url: "" ])
//                  dockerImage.push()
//       }      
//       }     
//     }
  
//   stage('pushing docker image') {
            
//         steps {
//             script {
               
                
//             }   
            
//   }
//   }
  }

post {  
        always {
            archiveArtifacts artifacts: 'backend/artifact.tar.gz', onlyIfSuccessful: true
        }
  }
}
//test-artifact artifact${BUILD_NUMBER}.tar.gz