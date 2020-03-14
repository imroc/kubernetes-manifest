#! /bin/bash

USERS=$(htpasswd -nb $1 $2)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: traefik-auth
  namespace: traefik
type: Opaque
stringData:
  users: ${USERS}
EOF