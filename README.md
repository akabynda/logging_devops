# Логирование и мониторинг

Работает под Docker Desktop на Mac. В корне лежит `docker-compose.yml`, в нем сервисы: приложение из репозитория, Prometheus, node exporter, Grafana, Loki и Promtail.

## Запуск

```bash
chmod +x *.sh
./02-up.sh
```

Скрипт сам скачает официальный проект:

```text
https://github.com/Lanjetto/demo-prometeus-app
```

и поднимет все через compose.

## Проверка

```bash
./03-check.sh
./04-generate-load.sh
./05-promtool-queries.sh
```

Адреса:

```text
Prometheus: http://localhost:9090
Targets: http://localhost:9090/targets
Alerts: http://localhost:9090/alerts
App: http://localhost:8080/hello
App metrics: http://localhost:8080/actuator/prometheus
Node exporter: http://localhost:9100/metrics
Grafana: http://localhost:3000
Grafana login/password: admin/admin
```

## Практика 1

Prometheus и node exporter запускаются через compose. Prometheus собирает свои метрики и метрики node exporter. Проверка через `http://localhost:9090/targets` и `./05-promtool-queries.sh`.

## Практика 2

Приложение берется из официального репозитория `Lanjetto/demo-prometeus-app`. Prometheus собирает метрики с `app:8080` по пути `/actuator/prometheus`. Для генерации запросов используй `./04-generate-load.sh`.

## Практика 3

Файл алертов лежит в `prometheus/alerts.yml`. Он подключен в `prometheus/prometheus.yml` через `rule_files`. Проверять в Prometheus на странице `http://localhost:9090/alerts`.

## Практика 4

Grafana, Loki и Promtail запускаются в том же compose. Источники данных Prometheus и Loki добавляются автоматически через provisioning. Dashboard импортируется автоматически из `grafana/dashboards/monitoring-dashboard.json` в папку Monitoring.

## Остановка

```bash
./06-down.sh
```

или полная очистка

```bash
./07-clean-all.sh
```