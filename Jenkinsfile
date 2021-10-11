pipeline{
    agent any
    environment{
        def scanner = tool 'scan'
    }
    stages{
        stage('Build'){
            steps{
            sh 'mvn clean package'
            }
        }
        stage('Sonar Scan'){
            steps{
                withSonarQubeEnv('sonarqube') {
                    sh "${scanner}/bin/sonar-scanner -Dproject.settings=sonar.properties"
                }
            }
        }

        stage('Publish Artifact'){
		steps{
	          //nexusPublisher nexusInstanceId: 'nexus', nexusRepositoryId: 'maven-nexus-repo', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/ILP_Fancystore.war']], mavenCoordinate: [artifactId: 'ILP', groupId: 'devops.ilp1', packaging: 'war', version: "${BUILD_NUMBER}"]]]
		  //sh 'curl -v -u admin:nexus@123 -X PUT "http://ec2-3-110-54-82.ap-south-1.compute.amazonaws.com:8081/repository/maven-nexus-repo" -T target/ILP_Fancystore.war'
                   sh 'curl -v -u admin:nexus@123 -X PUT "http://ec2-3-110-54-82.ap-south-1.compute.amazonaws.com:8081/repository/maven-nexus-repo/Capstone-${BUILD_NUMBER}.war" -T target/ILP_Fancystore.war'

        }
	}
    
        stage('download Artifact'){
            steps{
                sh 'ansible-playbook -v -i ansible/inventory -e "var=${BUILD_NUMBER}" ansible/main.yml'
            }
        }
        stage('Docker build'){
            steps{
                sh 'docker build --build-arg version=${BUILD_NUMBER} -f docker/Dockerfile -t capstone:${BUILD_NUMBER} docker/' 
            }
        }
    }
}
