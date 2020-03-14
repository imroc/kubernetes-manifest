#! /bin/bash

# USAGE:
# ./install.sh <API-TOKEN>

./create-cloudflare-apitoken-secret.sh $1
kubectl apply -f .
