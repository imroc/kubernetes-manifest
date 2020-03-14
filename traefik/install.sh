#! /bin/bash

# USAGE: 
# ./install.sh username password

helm repo add traefik https://containous.github.io/traefik-helm-chart
helm repo update

helm install traefik traefik/traefik \
  --namespace traefik \
  --set ports.web.port=80 \
  --set ports.websecure.port=443 \
  --set kubernetes.ingressClass=traefik \
  --set kubernetes.ingressEndpoint.useDefaultPublishedService=true \
  --set rbac.enabled=true \
  --set ingressRoute.dashboard.enabled=false \
  --set service.annotations."service\.kubernetes\.io/tke-existed-lbid"=lb-acin8hom \
  --set additionalArguments="{--providers.kubernetesingress,--serverstransport.insecureskipverify=true}"