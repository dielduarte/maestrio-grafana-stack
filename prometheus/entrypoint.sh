#!/bin/sh
set -e

# Substitute environment variables into the Prometheus config
envsubst < /etc/prometheus/prom.yml.template > /etc/prometheus/prom.yml

# Start Prometheus
exec /bin/prometheus \
  --config.file=/etc/prometheus/prom.yml \
  --storage.tsdb.path=/prometheus
