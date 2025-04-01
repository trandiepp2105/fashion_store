#!/bin/bash

DB_USER="your_user"
DB_NAME="your_database"

# Chạy file initial.sql trước
echo "Running initial.sql..."
psql -U $DB_USER -d $DB_NAME -f sql/initial.sql

# Chạy các file trong thư mục schema theo thứ tự
echo "Running schema files..."
for file in sql/schema/*.sql; do
    echo "Running $file..."
    psql -U $DB_USER -d $DB_NAME -f "$file"
done

# Chạy các file trong thư mục data nếu có
echo "Running data files..."
for file in sql/data/*.sql; do
    echo "Running $file..."
    psql -U $DB_USER -d $DB_NAME -f "$file"
done

echo "All SQL files executed successfully!"
