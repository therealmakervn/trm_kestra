#!/bin/bash

# Parse DATABASE_URL từ Railway
# Format: postgresql://user:password@host:port/dbname

DB_URL=$DATABASE_URL

# Extract components
DB_USER=$(echo $DB_URL | awk -F[:/@] '{print $4}')
DB_PASSWORD=$(echo $DB_URL | awk -F[:/@] '{print $5}')
DB_HOST=$(echo $DB_URL | awk -F[:/@] '{print $6}')
DB_PORT=$(echo $DB_URL | awk -F[:/@] '{print $7}')
DB_NAME=$(echo $DB_URL | awk -F[:/@] '{print $8}')

# Export variables
export DB_USER
export DB_PASSWORD
export DB_HOST
export DB_PORT
export DB_NAME
