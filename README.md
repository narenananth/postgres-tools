# postgres-tools

Very simple shell scripts to work with PostgreSQL.

## Files

- `backup.sh` – creates a `.sql` backup file in `./backups`
- `healthcheck.sh` – runs a simple query to check if the database is reachable

## How to use (example with local Postgres container)

```bash
# 1. Start Postgres with Docker (example)
docker run -d \
  --name pg-db \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  postgres:15

# 2. Clone this repo locally
git clone https://github.com/YOUR_USERNAME/postgres-tools.git
cd postgres-tools

# 3. Make scripts executable
chmod +x backup.sh healthcheck.sh

# 4. Set password (matches the container above)
export PGPASSWORD=postgres

# 5. Run backup
./backup.sh

# 6. Run health check
./healthcheck.sh
