#!/bin/sh
set -e

# Substitute environment variables into the Prometheus config
sed -e "s|\${METRICS_SCHEME}|${METRICS_SCHEME}|g" \
    -e "s|\${METRICS_SECRET}|${METRICS_SECRET}|g" \
    -e "s|\${DASHBOARD_HOST}|${DASHBOARD_HOST}|g" \
    /etc/prometheus/prom.yml.template > /etc/prometheus/prom.yml

# Start Prometheus
exec /bin/prometheus \
  --config.file=/etc/prometheus/prom.yml \
  --storage.tsdb.path=/prometheus
