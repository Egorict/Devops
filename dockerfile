FROM nginx:alpine

# Копируем ваш HTML-файл
COPY index.html /usr/share/nginx/html/index.html

# Создаём каталоги, которые нужны nginx для кеширования и логов,
# и даём права пользователю nginx на запись
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/run /var/log/nginx

# Переключаемся на пользователя nginx (уже существует в образе)
USER nginx

EXPOSE 80

# Healthcheck для проверки доступности
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1