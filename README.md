# maprnetes
Scripts to deploy 1 minikube + 1 single node MapR cluster for development purposes.

With this two components you can benefit from :
- mounting MapR cluster on any development workstation to store code on the cluster
- running applications in containers orchestrated by Kubernetes 



The K8s node will use the MapR posix client to access data stored on the MapR node.
This allow for simple 

MapR components installed:
- core
    - zookeeper
    - CLDB
    - MapR File System (MFS)
- NFS server
- Kafka API for MapR Streams
- MapR Data Access Gateway (for lightweight OJAI clients)
- MapR Control System (MCS)


Prerequisites :
- 1 VM with Centos 7 and 16GB RAM
- ansible (yum install ansible)


Usage :

./install.sh CLUSTER_NAME

