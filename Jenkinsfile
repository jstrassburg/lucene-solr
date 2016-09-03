node {
    stage "Build Solr Package"
    env.PATH = "${tool 'ant'}/bin:${env.PATH}"
    checkout scm
    sh 'ant ivy-bootstrap'
    sh 'ant -Dversion.suffix=${BUILD_NUMBER} create-package -f solr/build.xml'
    archive 'solr/package/**/*.tgz'

    stage "Test Solr"
    echo "This is where we would run: sh 'ant test -f solr/build.xml'"

    stage "Deploy Solr"
    echo "TODO: deploy"
}
