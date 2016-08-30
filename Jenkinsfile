node {
    stage "Build Solr Package"
    env.PATH = "${tool 'Ant'}/bin:${env.PATH}"
    sh 'ant create-package -f solr/build.xml'
    archive 'solr/package/**/*.tgz'

    stage "Test Solr"
    env.PATH = "${tool 'Ant'}/bin:${env.PATH}"
    sh 'ant test -f solr/build.xml'

    stage "Deploy Solr"
    echo "TODO: deploy"
}
