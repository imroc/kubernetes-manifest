#! /bin/bash

# USAGE:
# ./create-cloudflare-apitoken-secret.sh <API-TOKEN>

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token-secret
  namespace: cert-manager
type: Opaque
stringData:
  api-token: $1
EOF