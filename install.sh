#! /bin/bash

# install MapR cluster
ansible-playbook -i mapr/myhosts/single_node mapr/site-cluster.yml

# Change MCS port from 8443 to 9443
sed -i 's/8443/9443/g' /opt/mapr/apiserver/conf/properties.cfg

# install and start Minikube
k8s/install-minikube.sh

# install MapR kdf plugin
k8s/install-kdf.sh





