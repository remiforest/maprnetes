#! /bin/bash

if [$# -ne 2]; 
    then echo "arguments required : ./install-client.sh CLUSTER_NAME CLUSTER_IP"
fi

CLUSTER_NAME=$1
CLUSTER_IP=$2

rpm --import https://package.mapr.com/releases/pub/maprgpg.key

if [ $HOSTTYPE = "x86_64" ]
then
  yum install mapr-client.x86_64
else
  yum install mapr-client.i386
fi

/opt/mapr/server/configure.sh -N $CLUSTER_NAME -c -C $CLUSTER_IP:7222

