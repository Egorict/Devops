# Берем готовый образ с веб-сервером Nginx
FROM nginx:alpine

# Создаем непривилегированного пользователя
RUN adduser -D -s /bin/sh -u 1000 -g "App User" appuser

# Копируем ваш HTML-файл в папку, которую Nginx показывает по умолчанию
COPY index.html /usr/share/nginx/html/index.html

# Меняем владельца файлов на созданного пользователя
RUN chown -R appuser:appuser /usr/share/nginx/html

# Переключаемся на созданного пользователя
USER appuser

# Говорим, что контейнер будет слушать 80 порт
EXPOSE 80

# (Опционально) Добавляем healthcheck — это будет полезно и для следующей ошибки
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1