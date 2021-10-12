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
		withCredentials([usernamePassword(credentialsId: 'nexus-creds', passwordVariable: 'pass', usernameVariable: 'user')]){
	          sh 'mvn deploy:deploy-file -DgroupId=devops.ilp -DartifactId=ILP -Dversion="${BUILD_NUMBER}" -DgeneratePom=true -Dpackaging=war -DrepositoryId=nexus -Durl="http://${user}:${pass}@ec2-3-110-37-51.ap-south-1.compute.amazonaws.com:8081/repository/maven-nexus-repo/" -Dfile=target/ILP_Fancystore.war'
        }
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
