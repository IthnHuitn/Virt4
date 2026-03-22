#!/bin/bash

set -e

BACKUP_DIR="/opt/backup"
ENV_FILE="/opt/virt4/.env"
DATE=$(date +%Y%m%d_%H%M%S)

# Загружаем переменные
source ${ENV_FILE}

DB_HOST="db"
DB_NAME="${MYSQL_DATABASE}"
DB_USER="${MYSQL_USER}"
DB_PASSWORD="${MYSQL_PASSWORD}"
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}_${DATE}.sql.gz"

# Создаем директорию
mkdir -p ${BACKUP_DIR}

echo "=== Резервное копирование: $(date) ==="

# Бэкап с подавлением лишнего вывода
docker run --rm \
  --network virt4_backend \
  schnitzler/mysqldump \
  mysqldump --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} \
    --databases ${DB_NAME} \
    --single-transaction \
    --quick \
    --lock-tables=false 2>/dev/null | gzip > ${BACKUP_FILE}

if [ $? -eq 0 ] && [ -s ${BACKUP_FILE} ]; then
    echo "✅ Бэкап: $(basename ${BACKUP_FILE}) ($(du -h ${BACKUP_FILE} | cut -f1))"
    
    # Ротация (оставляем 10 последних)
    ls -t ${BACKUP_DIR}/backup_${DB_NAME}_*.sql.gz 2>/dev/null | tail -n +11 | xargs -r rm
else
    echo "❌ Ошибка"
    exit 1
fi
