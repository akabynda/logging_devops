#!/bin/bash
set -e

./01-prepare-project.sh

echo "Запускаю сервисы из docker-compose.yml"
docker compose up --build -d

echo "Жду запуск сервисов"
sleep 20

docker compose ps

echo "Готово"
echo "Prometheus: http://localhost:9090"
echo "Targets: http://localhost:9090/targets"
echo "Alerts: http://localhost:9090/alerts"
echo "App: http://localhost:8080/hello"
echo "App metrics: http://localhost:8080/actuator/prometheus"
echo "Node exporter: http://localhost:9100/metrics"
echo "Grafana: http://localhost:3000"
echo "Grafana login/password: admin/admin"
