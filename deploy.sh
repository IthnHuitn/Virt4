#!/bin/bash

set -e  # Выход при ошибке

echo "=== 1. Обновление системы и установка доп. пакетов ==="
sudo apt-get update
# Устанавливаем docker-compose если нужно
if ! command -v docker-compose &> /dev/null; then
    echo "Устанавливаем docker-compose..."
    sudo apt-get install -y docker-compose-plugin
fi

echo "=== 2. Клонирование или обновление fork-репозитория в /opt ==="
cd /opt
# ВНИМАНИЕ: ЗАМЕНИТЕ НА СВОЙ FORK!
REPO_URL="https://github.com/IthnHuitn/Virt4.git"
TARGET_DIR="/opt/virt4-app"

if [ -d "$TARGET_DIR" ]; then
    echo "Репозиторий уже существует. Обновляем..."
    cd "$TARGET_DIR"
    git pull origin main  # или master, смотрите название вашей ветки
else
    echo "Клонируем репозиторий..."
    sudo git clone "$REPO_URL" "$TARGET_DIR"
    sudo chown -R $USER:$USER "$TARGET_DIR"
fi
cd "$TARGET_DIR"

echo "=== 3. Проверка наличия необходимых файлов ==="
if [ ! -f "Dockerfile.python" ] || [ ! -f "compose.yaml" ] || [ ! -f ".env" ] || [ ! -f "proxy.yaml" ]; then
    echo "Ошибка: Не найдены все необходимые файлы в репозитории!"
    exit 1
fi

echo "=== 4. Остановка и удаление старых контейнеров (если есть) ==="
sudo docker compose down -v 2>/dev/null || true
sudo docker system prune -f

echo "=== 5. Исправление версии HAProxy в proxy.yaml (если нужно) ==="
# Проверяем, есть ли строка с haproxy:2.4 и заменяем на haproxy:3.0
if grep -q "haproxy:2.4" proxy.yaml; then
    echo "Обновляем версию HAProxy с 2.4 на 3.0..."
    sed -i 's/haproxy:2.4/haproxy:3.0/g' proxy.yaml
fi

echo "=== 6. Запуск проекта через docker compose ==="
sudo docker compose up -d --build

echo "=== 7. Ожидание запуска контейнеров (30 секунд) ==="
sleep 30

echo "=== 8. Проверка статуса контейнеров ==="
sudo docker compose ps

echo "=== 9. Проверка работы приложения локально ==="
curl -L http://127.0.0.1:8090
curl -L http://127.0.0.1:8090/requests

echo "=== 10. Проверка доступности из интернета ==="
PUBLIC_IP=$(curl -s ifconfig.me)
echo "Попробуйте открыть в браузере: http://$PUBLIC_IP:8090"
echo "Или используйте внешние сервисы, например: https://check-host.net/check-http"

echo "=== 11. Выполнение SQL-запроса к БД ==="
# Получаем пароль из .env файла
MYSQL_ROOT_PASSWORD=$(grep MYSQL_ROOT_PASSWORD .env | cut -d '=' -f2 | tr -d '"')
if [ -n "$MYSQL_ROOT_PASSWORD" ]; then
    sudo docker compose exec db mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "
    SHOW DATABASES;
    USE virtd;
    SHOW TABLES;
    SELECT * FROM requests LIMIT 10;
    " 2>/dev/null || echo "Не удалось выполнить SQL запрос. Возможно, таблица еще не создана."
else
    echo "Не удалось получить пароль из .env файла"
fi

echo "=== ГОТОВО! ==="
