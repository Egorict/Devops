# Берем готовый образ с веб-сервером Nginx
FROM nginx:alpine

# Создаем непривилегированного пользователя
RUN adduser -D -s /bin/sh -u 1000 -g "App User" appuser

# Копируем ваш HTML-файл
COPY index.html /usr/share/nginx/html/index.html

# Создаем и даем права на каталоги, которые нужны nginx
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx && \
    chown -R appuser:appuser /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

# Переключаемся на созданного пользователя
USER appuser

# Открываем порт
EXPOSE 80

# Добавляем healthcheck (для Checkov)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1