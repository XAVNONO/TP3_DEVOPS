pipeline {

//>>>>>Définition paramétres d'environnements et images
        environment {
        registry = "xavnono/mypylint"
        registry2 = "xavnono/myunittest"
        registry3 = "xavnono/mypythonapp"
        registryCredential = 'dockerhub'
        dockerImage = ''
        dockerImage2 = ''
        }

    agent any

//>>>>>Récupéreration du code source du dépôt github
    stages {
        stage('Clone Github') {
            steps {
                git branch: 'main', credentialsId: 'token-github', url: 'https://github.com/XAVNONO/TP3_DEVOPS.git'
            }
        }

//>>>>>Lancer un linter qui vérifiera les normes de codage (+rapport)
        //>>>>>Pylint        
        stage('Build Pylint image') {
            steps {
                script {
                    dockerImage = docker.build (registry + ":$BUILD_NUMBER","-f docker-test/pylint/Dockerfile docker-test/pylint/")
                }
            }
        }
        
        stage('Push pylint image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push 'latest'
                    dockerImage.push()
                    }
                }
            }
        }
        
        stage ('Pylint'){
            agent {
                docker {
                    image 'xavnono/mypylint'
                    args '-v ${PWD}:/app'
                    reuseNode true
                }
            }
            steps {
                sh 'mkdir -p app/reports/pylint; pylint --output-format json --recursive yes --exit-zero app > app/reports/pylint/report.json;pylint-json2html -o app/reports/pylint/report.html app/reports/pylint/report.json'
            }
        }

        stage('Publish HTML Pylint'){
            steps {
                publishHTML (target : [allowMissing: false,
                     alwaysLinkToLastBuild: true,
                     keepAll: true,
                     reportDir: 'app/reports/pylint/',
                     reportFiles: 'report.html',
                     reportName: 'My Pylint Reports',
                     reportTitles: 'The Report'])
            }
        }

//>>>>>Analyser la complexité cyclomatique (+rapport)
        //>>>>>SonarQube



//>>>>>Lancer les tests unitaires de l’application (+rapport)
        // >>>>>Unitest
        stage('Build Unittest image') {
            steps {
                script {
                    dockerImage2 = docker.build (registry2 + ":$BUILD_NUMBER","-f docker-test/unittest/Dockerfile docker-test/unittest/")
                }
            }
        }
        
        stage('Push unittest image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage2.push 'latest'
                    dockerImage2.push()
                    }
                }
            }
        }
        
        stage ('Unittest'){
            agent {
                docker {
                    image 'xavnono/myunittest'
                    args '-v ${PWD}:/app'
                    reuseNode true
                }
            }
            steps {
                sh 'cd app; python -m unittest test/unit/test.py'
            }
        }
        
        stage('Publish HTML unittest'){
            steps {
                publishHTML (target : [allowMissing: false,
                     alwaysLinkToLastBuild: true,
                     keepAll: true,
                     reportDir: 'app/reports/unittest/',
                     reportFiles: 'report.html',
                     reportName: 'My unittest Reports',
                     reportTitles: 'The Report'])
            }
        }

//>>>>>Construire l'image de Docker pour vérification
        // stage('Build image') {
        //     steps {
        //         script {
        //             dockerImage = docker.build (registry3 + ":$BUILD_NUMBER","-f docker-app/python/Dockerfile .")
        //         }
        //     }
        // }
        
//>>>>>Pusher l’image Docker sur le docker hub
        //  stage('Push image') {
        //     steps {
        //         script {
        //             docker.withRegistry( '', registryCredential ) {
        //             dockerImage.push()
        //             }
        //         }
        //     }
        // }
    }
}  