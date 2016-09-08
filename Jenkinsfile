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
    sh 'scripts/deploy_server.sh 10.0.0.11 solr /usr/local/solr 8983 ~/stage_private_key'

    stage "Deploy Solr - Production Env"
    sh 'scripts/deploy_server.sh 10.0.0.12 solr /usr/local/solr 8983 ~/prod_private_key'
}
