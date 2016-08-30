node {
    stage "Build Solr Package"
    env.PATH = "${tool 'ant'}/bin:${env.PATH}"
    checkout scm
    sh 'ant ivy-bootstrap'
    sh 'ant create-package -f solr/build.xml'
    archive 'solr/package/**/*.tgz'

    stage "Test Solr"
    env.PATH = "${tool 'ant'}/bin:${env.PATH}"
    sh 'ant test -f solr/build.xml'

    stage "Deploy Solr"
    echo "TODO: deploy"
}
