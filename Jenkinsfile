pipeline {
    agent none

    parameters {
        string(name:'git_tag', defaultValue:'', description:'docker image tag')
    }

    environment {
        git_user = 'aeternus'
        git_email = 'aeternus@aliyun.com'
        image_name = 'tools'
    }

    stages {
        stage('Build') {
            agent { dockerfile true }

            steps {
                sh 'echo "SUCESSE!"'
            }
        }

        stage('Tag') {
            agent { docker { image 'aeternuss/tools:1.0.0-alpine' } }

            environment {
                GITHUB_AUTH = credentials('GitHub-PAT')
            }

            when {
                beforeAgent true
                expression { params.git_tag ==~ /^v[0-9.]+/ }
            }

            steps {
                sh 'git config --global user.name ${git_user}'
                sh 'git config --global user.email ${git_email}'
                sh 'git config --local credential.helper "!p() { echo username=${GITHUB_AUTH_USR}; echo password=${GITHUB_AUTH_PSW}; }; p"'

                sh 'git tag ${git_tag}'
                sh 'git push origin ${git_tag}'
            }
        }
    }
}
