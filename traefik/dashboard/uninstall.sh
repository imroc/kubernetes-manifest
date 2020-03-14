#! /bin/bash

kubectl delete -f .
kubectl -n kube-system delete secret traefik-auth