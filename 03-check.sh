#!/bin/bash
set -e

check_url() {
  local name="$1"
  local url="$2"
  echo "$name"
  curl -fsS "$url" >/dev/null && echo "ok: $url" || echo "fail: $url"
}

docker compose ps

check_url "Prometheus" "http://localhost:9090/-/ready"
check_url "Prometheus targets page" "http://localhost:9090/targets"
check_url "App" "http://localhost:8080/hello"
check_url "App metrics" "http://localhost:8080/actuator/prometheus"
check_url "Node exporter" "http://localhost:9100/metrics"
check_url "Grafana" "http://localhost:3000/login"
check_url "Loki" "http://localhost:3100/ready"

echo "Prometheus targets"
curl -fsS "http://localhost:9090/api/v1/targets" | python3 -m json.tool | sed -n '1,120p'

echo "Alerts"
curl -fsS "http://localhost:9090/api/v1/rules" | python3 -m json.tool | sed -n '1,120p'
