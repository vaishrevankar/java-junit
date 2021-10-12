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
		withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'pass', usernameVariable: 'user')]){
	          sh 'mvn deploy:deploy-file -DgroupId=devops.ilp -DartifactId=ILP -Dversion="${BUILD_NUMBER}" -DgeneratePom=true -Dpackaging=war -DrepositoryId=nexus -Durl="http://admin:nexus123@ec2-3-110-37-51.ap-south-1.compute.amazonaws.com:8081/repository/maven-nexus-repo/" -Dfile=target/ILP_Fancystore.war'
        }
	}
}


    }
}
