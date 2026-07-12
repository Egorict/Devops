FROM nginx:alpine

# Копируем ваш HTML-файл
COPY index.html /usr/share/nginx/html/index.html

# Убеждаемся, что файлы принадлежат пользователю nginx
RUN chown -R nginx:nginx /usr/share/nginx/html

# Переключаемся на пользователя nginx (он уже есть в образе)
USER nginx

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1
