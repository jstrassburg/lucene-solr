# Usage from Jenkins:
# deploy_server.sh server_to_deploy_to service_name solr_install_dir port SSHKEYFILE
# deploy_server.sh 10.0.0.11 solr /usr/local/solr 8983 ~/private_key

server="$1"
service_name="$2"
solr_install_dir="$3"
solr_port="$4"
SSHKEYFILE="$5"

DEPLOY_DIR=~/deploy

# Install pre-requesites
ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $SSHKEYFILE vagrant@$server << PREREQ
    sudo apt-get update -qy
    sudo apt-get install default-jre
PREREQ

# Copy Solr package
solr_tarball=$(find solr/package -name solr*.tgz)
solr_tarball_basename=$(basename "$solr_tarball")
solr_tarball_filename=${solr_tarball_basename%.tgz}
echo "Copying package $solr_tarball to $server..."
scp -i $SSHKEYFILE $solr_tarball vagrant@$server:$DEPLOY_DIR

# Install Solr package
ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $SSHKEYFILE vagrant@$server << INSTALL
    cd $DEPLOY_DIR

    tar xzf $solr_tarball_basename $solr_tarball_filename/bin/install_solr_service.sh --strip-components=2
    sudo ./install_solr_service.sh $solr_tarball_basename -d $solr_install_dir -u $service_name -s $service_name -p $solr_port -f
    
    echo "Removing all Solr packages on $server..."
    rm $DEPLOY_DIR/install_solr_service.sh
    rm $DEPLOY_DIR/solr*.tgz
INSTALL