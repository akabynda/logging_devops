#!/bin/bash
set -e

REPO_URL="https://github.com/Lanjetto/demo-prometeus-app"
APP_DIR="demo-prometeus-app"

if [ -d "$APP_DIR/.git" ]; then
  echo "Репозиторий уже есть, обновляю"
  git -C "$APP_DIR" pull --ff-only || true
else
  echo "Клонирую репозиторий приложения"
  rm -rf "$APP_DIR"
  git clone "$REPO_URL" "$APP_DIR"
fi

if [ ! -d "$APP_DIR" ]; then
  echo "Не удалось подготовить приложение"
  exit 1
fi

echo "Проект подготовлен"
