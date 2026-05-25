#!/bin/bash
set -e

echo "Скорость записи на диск"
docker exec prometheus promtool query instant http://localhost:9090 'rate(node_disk_written_bytes_total[5m]) / 1024' || true

echo "Память использовано в процентах"
docker exec prometheus promtool query instant http://localhost:9090 '(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100' || true

echo "CPU в процентах"
docker exec prometheus promtool query instant http://localhost:9090 '100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)' || true

echo "RPS приложения"
docker exec prometheus promtool query instant http://localhost:9090 'sum(rate(http_server_requests_seconds_count[5m]))' || true
