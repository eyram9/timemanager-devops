#!/bin/sh

echo "Waiting for PostgreSQL..."

until pg_isready -h "$PGHOST" -p "$PGPORT" -U "$PGUSER"; do
    echo "PostgreSQL is not ready, waiting 1 second..."
    sleep 1
done

echo "PostgreSQL is ready!"

mix ecto.create
exec "$@"