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
                sh 'curl -u admin:nexus@123 -X PUT "http://ec2-13-233-193-48.ap-south-1.compute.amazonaws.com:8081/artifactory/libs-snapshot-local/Capstone-${BUILD_NUMBER}.war" -T target/*.war'
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
