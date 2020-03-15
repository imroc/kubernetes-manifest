#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

CHART_ROOT=$(dirname "${BASH_SOURCE[0]}")/../chart

helm template traefik ${CHART_ROOT}/traefik.tgz \
    --set ports.web.port=80 \
    --set ports.websecure.port=443 \
    --set kubernetes.ingressClass=traefik \
    --set kubernetes.ingressEndpoint.useDefaultPublishedService=true \
    --set ingressRoute.dashboard.enabled=false \
    --set service.annotations."service\.kubernetes\.io/tke-existed-lbid"=lb-acin8hom \
    --set additionalArguments="{--providers.kubernetesingress,--serverstransport.insecureskipverify=true,--api=true}" \
    --set rbac.enabled=true > ${CHART_ROOT}/traefik.yaml

