#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

CHART_ROOT=$(dirname "${BASH_SOURCE[0]}")/../chart

helm template grafana ${CHART_ROOT}/grafana.tgz \
    --namespace grafana \
    --set testFramework.enabled=false \
    --set persistence.enabled=true \
    --set persistence.size=100G > ${CHART_ROOT}/grafana.yaml

