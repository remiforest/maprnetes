#! /bin/bash

# set up mapr volume
python mapr/set_mapr_volume.py

# install MapR cluster
ansible-playbook -i mapr/myhosts/single_node mapr/site-cluster.yml

# Change MCS port from 8443 to 9443
sed -i 's/8443/9443/g' /opt/mapr/apiserver/conf/properties.cfg

# restart MCS
service mapr-warden restart

# install and start Minikube
k8s/install-minikube.sh

# install MapR kdf plugin
k8s/install-kdf.sh

echo "Done !"



