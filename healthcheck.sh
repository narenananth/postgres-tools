#!/usr/bin/env bash

# Very simple Postgres health check script

DB_NAME="postgres"
DB_USER="postgres"
DB_HOST="localhost"

echo "Checking Postgres health..."

PGPASSWORD="${PGPASSWORD:-postgres}" psql \
  -h "$DB_HOST" \
  -U "$DB_USER" \
  -d "$DB_NAME" \
  -c "SELECT now() AS time, pg_database_size('$DB_NAME') AS db_size_bytes;"

if [ $? -eq 0 ]; then
  echo "Postgres is reachable."
else
  echo "Could not connect to Postgres."
fi
