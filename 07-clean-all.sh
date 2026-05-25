#!/bin/bash
set -e

docker compose down -v --remove-orphans
rm -rf demo-prometeus-app
