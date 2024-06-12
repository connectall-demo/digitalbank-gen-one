pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3" 
        // add something in here
        // TO DO - add more here again
        // another comment for another demo
    }
    
    stages {
        
        stage('Checkout') {
            steps {
                sh 'pwd;ls -lrt'
                sh 'rm -rf digitalbank-gen-one'
                // git 'https://github.com/connectall-demo/digitalbank-gen-one.git'
                checkout scm
                sh 'pwd;ls -lrt'
                sh 'chmod -R 777 .'
            }
        }
        
        stage('Clean') {
            steps {
                echo 'Hello World'
                sh "mvn clean:clean -f bank/pom.xml"
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
               // sh "mvn -Dmaven.test.failure.ignore=true clean package -f digitalbank-gen-one/bank/pom.xml"

                catchError(message: "Something went wrong", buildResult: 'UNSTABLE', stageResult: 'UNSTABLE') {
                    sh "exit 1"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
               // sh "mvn test -f digitalbank-gen-one/bank/pom.xml"
            }
        }
        stage('Package') {
            steps {
                echo 'Package'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publish'
            }
        }

        stage('Post Results') {
            steps {
                sh 'source ./scripts/setup.sh'
                sh 'env'
                script {
                    env.BUILD_RESULT = currentBuild.currentResult
                    echo "Build status: ${env.BUILD_RESULT}"
                }
                sh './scripts/postresults.sh'
            }
        }
    }
}
