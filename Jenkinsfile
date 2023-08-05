pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                podman build -f apps/nft-bridge/Dockerfile . -t nft-bridge
            }
        }
    }
}