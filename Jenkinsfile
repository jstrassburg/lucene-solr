node {
    stage "Build Solr Package"
    env.PATH = "${tool 'ant'}/bin:${env.PATH}"
    checkout scm
    sh 'ant ivy-bootstrap'
    sh 'ant -Dversion.suffix=${BUILD_NUMBER} create-package -f solr/build.xml'
    archive 'solr/package/**/*.tgz'

    stage "Test Solr"
    echo "This is where you might run: sh 'ant test'"

    stage "Deploy Solr - Stage Env"
    sh 'ssh -i ~/stage_private_key -o StrictHostKeyChecking=no vagrant@10.0.0.11 "sudo ifconfig"'

    stage "Deploy Solr - Production Env"
    sh 'ssh -i ~/prod_private_key -o StrictHostKeyChecking=no vagrant@10.0.0.12 "sudo ifconfig"'
}
