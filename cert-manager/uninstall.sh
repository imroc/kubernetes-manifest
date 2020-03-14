#! /bin/bash

kubectl delete --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.13.1/cert-manager.yaml
kubectl delete namespace cert-manager
