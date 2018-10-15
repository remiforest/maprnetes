#! /bin/bash

if [ $# -ne 2 ]; 
    then echo "arguments required : ./install-client.sh CLUSTER_NAME CLUSTER_IP"
fi

CLUSTER_NAME=$1
CLUSTER_IP=$2

echo -e "[maprtech] \nname=MapR Technologies \nbaseurl=http://package.mapr.com/releases/v6.1.0/redhat/ \nenabled=1 \ngpgcheck=1 \nprotect=1" >>  /etc/yum.repos.d/mapr_core.repo
echo -e "[maprecosystem] \nname=MapR Technologies \nbaseurl=https://package.mapr.com/releases/MEP/MEP-6.0.0/redhat \nenabled=1 \ngpgcheck=1 \nprotect=1" >>  /etc/yum.repos.d/mapr_core.repo
rpm --import https://package.mapr.com/releases/pub/maprgpg.key

yum update -y
yum install -y java-1.8.0-openjdk-devel 

yum install -y mapr-posix-client-basic

mkdir /mapr
chmod u+s /opt/mapr/bin/fusermount


/opt/mapr/server/configure.sh -N $CLUSTER_NAME -c -C $CLUSTER_IP -Z $CLUSTER_IP

service mapr-posix-client-basic start
