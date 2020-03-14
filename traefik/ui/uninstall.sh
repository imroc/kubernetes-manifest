#! /bin/bash

kubectl delete -f .
kubectl -n traefik delete secret traefik-auth