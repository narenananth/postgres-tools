```bash
#!/usr/bin/env bash

# Very simple Postgres backup script

DB_NAME="postgres"
DB_USER="postgres"
DB_HOST="localhost"     # or container name
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$BACKUP_DIR"

FILE_NAME="$BACKUP_DIR/${DB_NAME}_backup_${TIMESTAMP}.sql"

echo "Creating backup: $FILE_NAME"

PGPASSWORD="${PGPASSWORD:-postgres}" pg_dump \
  -h "$DB_HOST" \
  -U "$DB_USER" \
  "$DB_NAME" > "$FILE_NAME"

if [ $? -eq 0 ]; then
  echo "Backup completed successfully."
else
  echo "Backup failed."
  rm -f "$FILE_NAME"
fi
