#! /bin/bash

# USAGE: 
# ./install.sh username password

./create-traefik-basicauth-secret.sh $1 $2
kubectl apply -f .