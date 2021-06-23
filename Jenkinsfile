pipeline {
    agent any
    stages {
        
        stage('clearing up docker images') {
            steps {
                sh 'docker ps'
                sh 'docker rm -f petclinic-started-by-jenkins'
            }
        }
        stage('Building artifacts and what not') { 
            steps {
                sh 'echo starting build'
                sh './mvnw package'
            }
        }
        // stage('Initialize docker') {
        //     steps {
        //         def dockerHome = tool 'docker'
        //         env.PATH = "${dockerHome}/bin:${env.PATH}"
        //     }
        // }
        stage('Creating docker container') {
            steps {
                sh 'echo creating docker image...'
                sh 'docker build -t petclinic-docker .'
                sh 'echo creating docker container...'
                sh 'docker run -dp 8888:8080 --name petclinic-started-by-jenkins petclinic-docker'
            }
        }
        stage('Pushing image to nexus repo') {
            steps {
                sh 'echo tagging image'
                sh 'docker tag petclinic-docker 172.16.238.7:8083/petclinic-docker:v1'
                sh 'echo logging into nexus...'
                sh 'docker login -u admin -p@nokiaE71@ 172.16.238.7:8083'
                sh 'echo pusing image to nexus'
                sh 'docker push 172.16.238.7:8083/petclinic-docker:v1'
            }
        }
        
    }
}
