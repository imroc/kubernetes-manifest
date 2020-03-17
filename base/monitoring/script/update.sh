#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

MONITORING_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
KUBE_PROMETHEUS_ROOT=${MONITORING_ROOT}/kube-prometheus
MANIFESTS_ROOT=${KUBE_PROMETHEUS_ROOT}/manifests

cd ${KUBE_PROMETHEUS_ROOT}
git pull
cd -

mv ${MANIFESTS_ROOT}/kube-state-metrics*.yaml ${MONITORING_ROOT}/kube-state-metrics/
mv ${MANIFESTS_ROOT}/alertmanager*.yaml ${MONITORING_ROOT}/alertmanager/
mv ${MANIFESTS_ROOT}/grafana*.yaml ${MONITORING_ROOT}/grafana/
mv ${MANIFESTS_ROOT}/node-exporter*.yaml ${MONITORING_ROOT}/node-exporter/
mv ${MANIFESTS_ROOT}/prometheus-adapter*.yaml ${MONITORING_ROOT}/prometheus-adapter/
mv ${MANIFESTS_ROOT}/prometheus*.yaml ${MONITORING_ROOT}/prometheus/
mv ${MANIFESTS_ROOT}/setup/prometheus*.yaml ${MONITORING_ROOT}/prometheus/

cd ${KUBE_PROMETHEUS_ROOT}
git reset --hard HEAD