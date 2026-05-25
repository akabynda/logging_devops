#!/bin/bash
set -e

COUNT="${1:-30}"

echo "Отправляю запросы в приложение: $COUNT"
for i in $(seq 1 "$COUNT"); do
  curl -fsS "http://localhost:8080/request-$i" >/dev/null || true
  sleep 0.2
done

echo "Готово. Проверь Grafana и Prometheus через пару секунд."
