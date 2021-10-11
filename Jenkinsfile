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
	          nexusPublisher nexusInstanceId: 'nexus', nexusRepositoryId: 'maven-nexus-repo', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/*.war']], mavenCoordinate: [artifactId: ILP', groupId: 'devops.ilp1', packaging: 'war', version: "${appVersion}"]]]
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
