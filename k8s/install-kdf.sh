#!/usr/bin/env bash

kubectl create -f kdf-namespace.yaml
kubectl create -f kdf-rbac.yaml
kubectl create -f kdf-plugin-centos.yaml
kubectl create -f kdf-provisioner.yaml
