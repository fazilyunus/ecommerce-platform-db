#!/bin/bash

# Define variables
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="ecommerce_backup_$DATE.sql"

# Create backup
pg_dump -U your_db_user -d your_db_name -F c -f "$BACKUP_DIR/$BACKUP_FILE"

# Print completion message
echo "Backup completed: $BACKUP_FILE"
