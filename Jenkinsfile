node {
    stage "Build Solr Package"
    env.PATH = "${tool 'ant'}/bin:${env.PATH}"
    checkout scm
    sh 'ant ivy-bootstrap'
    sh 'ant -Dversion.suffix=${BUILD_NUMBER} create-package -f solr/build.xml'
    archive 'solr/package/**/*.tgz'

    stage "Test Solr"
    sh 'ant test'

    stage "Deploy Solr"
    echo "TODO: deploy"
}
