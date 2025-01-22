#!/bin/bash
# Create each database
set -e
DBS=("epigraph_db" "iam_db")
for DB in "${DBS[@]}"; do
  echo "Checking if database $DB exists..."
  psql -U "$POSTGRES_USER" -tc "SELECT 1 FROM pg_database WHERE datname = '$DB';" | grep -q 1 || {
    echo "Creating database: $DB"
    psql -U "$POSTGRES_USER" -c "CREATE DATABASE $DB;"
  }
done